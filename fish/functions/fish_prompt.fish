function fish_prompt
  echo
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal
  echo (__fish_git_prompt ' ≡ %s')
  set_color magenta
  echo -n '❯ '
  set_color normal
  echo
end
