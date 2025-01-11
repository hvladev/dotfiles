# Terminal
set -x TERM xterm-ghostty

# Locale
set -x LC_ALL en_US.UTF-8

# Editor
set -x EDITOR nvim
abbr --add --global e $EDITOR

# Git
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showcolorhints 1
set -g __fish_git_prompt_char_stateseparator ' '

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

# GPG
set -x GPG_TTY (tty)

# Lazygit
abbr --add --global lg lazygit

# Ruby on Rails
abbr --add --global r bin/rails
