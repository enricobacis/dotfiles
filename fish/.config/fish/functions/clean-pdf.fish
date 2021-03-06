function clean-pdf --description 'Converts text pdfs into images pdfs and strips metadata' --argument filename
	if test -z $filename; or not test -e $filename
		echo "Usage: `clean-pdf filename.pdf` or `clean-pdf dirname`"
		return 1
	end

	if not type -q convert
		set_color red
		echo "Error: convert (imagemagick) not found"
		set_color normal
		return 1

	else if not type -q exiftool
		set_color red
		echo "Error: exiftool not found"
		set_color normal
		return 1

	else if not type -q qpdf
		set_color red
		echo "Error: qpdf not found"
		set_color normal
		return 1
	end

	if test -d $filename
		for f in $filename/*.pdf
			echo "[*] Cleaning $f ..."
			clean-pdf $f
		end

	else if test -f $filename
		set -l cleandir (dirname $filename)/clean
		set -l cleanname $cleandir/(basename $filename)
		mkdir -p $cleandir; and \
		convert -density 200 "$filename" "$cleanname"; and \
		exiftool -ignoreMinorErrors -all:all= "$cleanname"; and \
		exiftool -delete_original! "$cleanname"; and \
		qpdf --linearize "$cleanname" "$cleanname.2"; and \
		mv "$cleanname.2" "$cleanname"

		if test $status -eq 0
			set_color green
			echo -e "\n[*] $cleanname created"
			set_color normal
			return 0
		else
			set_color red
			echo -e "\n[*] Error creating file $cleanname"
			set_color normal
			return 1
		end

	else
		set_color red
		echo "Error: Unrecognized file $filename"
		set_color normal
		return 1
	end

end
