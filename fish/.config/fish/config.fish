# editors
set -gx EDITOR (type -q vim; and echo vim; or echo vi)
set -gx VISUAL $EDITOR
alias vi $EDITOR

# cups
set -gx CUPS_USER 'x'

# fzf
if type -q fzf
  if type -q rg; set -gx FZF_DEFAULT_COMMAND 'rg --files'
  else if type -q ag; set -gx FZF_DEFAULT_COMMAND 'ag --nocolor -g ""'
  end
end
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# terminal
set -gx TERMINAL sakura

# vagrant
set -gx VAGRANT_DEFAULT_PROVIDER virtualbox

# languages
set -gx LC_ALL "en_US.UTF-8"
set -gx LANG "en_US.UTF-8"

# start X at login
if begin status --is-login; and uname | grep -qi 'linux'; end
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# fisherman
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# fisherman/done
set -g __done_min_cmd_duration 10000
set -g __done_min_cmd_duration 10000
set -g __done_exclude '(^git|^vim|^ssh|^i?python[23]?$)'


# bobthefish
set -g theme_show_exit_status yes
set -g theme_date_format "+%a %d %b %Y %T %Z"

# bobthefish specific for the system (PEOPLE MAY WANT TO CHANGE THIS)
set -g default_user enrico
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g fish_color_search_match --background=purple

# rust
if test -d $HOME/.cargo/bin
  set -gx PATH $PATH $HOME/.cargo/bin
end

# go
if type -q go
  set -gx GOPATH $HOME/.go
  set -gx PATH $PATH $HOME/.go/bin
end

# ruby gems
if type -q ruby
  set -gx GEM_HOME $HOME/.gems
  set -gx PATH $PATH $GEM_HOME/bin
end

# fish bins
if test -d $HOME/.config/fish/bin
  set -gx PATH $PATH $HOME/.config/fish/bin
end

# local bins
if test -d $HOME/.local/bin
  set -gx PATH $PATH $HOME/.local/bin
end

# for local changes
if test -e ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end

# miniconda
set -l MINICONDA3_BIN $HOME/.miniconda3/bin
if test -f $MINICONDA3_BIN
# set -gx PATH $PATH $MINICONDA3_BIN
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/enrico/.miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
conda config --set auto_activate_base false
end
