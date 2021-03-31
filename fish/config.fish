# Locale variables

set -x LC_ALL en_US.UTF-8

# Git config
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showcolorhints 1
set -g __fish_git_prompt_char_stateseparator ' '

# Configure chruby
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

# Configure asdf
source /usr/local/opt/asdf/asdf.fish

set -x EDITOR nvim
set -x DISABLE_SPRING 1

# GPG
set -x GPG_TTY (tty)

# fix ruby path in neovim
function path-reordered -d "Echos the elements of $PATH, reordered such that custom paths precede standard system paths. This can be used to work around a fish 3.0.0 bug in which sub-shells fail to respect path ordering."
  set -l sys_paths

  for p in $PATH
      if string match -q -r '^/usr/|^/s?bin(/|$)' $p
          set -a sys_paths $p
      else
          echo $p
      end
  end

  for p in $sys_paths; echo $p; end
end

if not status --is-login
  set PATH (path-reordered)
end
# END fix ruby path in neovim

# Abbreviations

abbr --add --global e $EDITOR

abbr --add --global chkx tmuxinator start checkoutx

abbr --add --global g git
abbr --add --global gs git status
abbr --add --global gd git diff
abbr --add --global gds git diff --staged
abbr --add --global ga git add
abbr --add --global gc git commit
abbr --add --global gcm git commit -m
abbr --add --global gl git log --oneline --graph
abbr --add --global gco git checkout
abbr --add --global gfm git fetch origin master --prune
abbr --add --global gpm git pull origin master --prune
abbr --add --global grm git rebase -i --autosquash origin/master

abbr --add --global h heroku
abbr --add --global hr heroku run
