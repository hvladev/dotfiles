# Homebrew
fish_add_path --global /opt/homebrew/bin

# Locale variables
set -x LC_ALL en_US.UTF-8

# Git config
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showcolorhints 1
set -g __fish_git_prompt_char_stateseparator ' '

# Editor
set -x EDITOR nvim

# GPG
set -x GPG_TTY (tty)

# Abbreviations
abbr --add --global e $EDITOR

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

abbr --add --global lg lazygit

abbr --add --global r bin/rails
