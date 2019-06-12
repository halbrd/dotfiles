# Setup
# - put this file in ~/.config/fish/functions/fish_prompt.fish


set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green



function fish_prompt
  # colours
  set -l un_color blue
  set -l ct_color red
  set -l sh_color yellow
  set -l wd_color blue

  # values
  set -l username (id -un)
  set -l context (hostname)
  set -l shell fish
  set -l cwd (pwd | sed "s|^$HOME|~|")

  # print username, hostname, shell, working dir
  echo -n (set_color $un_color)$username(set_color normal) \
    'on' (set_color $ct_color)$context(set_color normal) \
    'using' (set_color $sh_color)$shell(set_color normal) \
    'in' (set_color $wd_color)$cwd(set_color normal)

  # maybe print git stuff
  if __fish_git_prompt > /dev/null
    echo -n ' working on'
    __fish_git_prompt
  end

  # linebreak/prompt
  echo
  echo '$ '

end
