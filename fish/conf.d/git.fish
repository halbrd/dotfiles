# these add to https://github.com/jhillyerd/plugin-git
abbr --add ggpush "git push origin (__git.current_branch)"
abbr --add ggpull "git pull origin (__git.current_branch)"
alias gcm="echo for git checkout master use gcom"
abbr --add gdl "git diff HEAD~ HEAD"
abbr --add gaac "git add --all; and git diff --cached"
abbr --add gcam "git commit --amend --no-edit"

# reference for tagging
function tag_help
  echo "list local tags      git tag"
  echo "pull remote tags     git fetch --tags"
  echo "create local tag     git tag -a -m 'tagging latest release' 0.0.0"
  echo "push local tag       git push origin 0.0.0"
  echo "delete local tag     git tag -d 0.0.0"
  echo "delete remote tag    git push --delete origin 0.0.0"
end
