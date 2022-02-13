function cb --description "Change git branch interactively"
  git branch | fzf-tmux --reverse -u 30% | xargs git checkout
end
