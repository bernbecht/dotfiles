# kill process by PID
die() {
    kill -9 "$1"
}
# find process running on a certain port
whoknocks() {
    lsof -i "$1"
}
# creates a folder with arg name
mk() {
    mkdir "$1"
}
# git hard reset to certain step behind
resetTo() {
  git reset --hard HEAD~"$1"
}
# git hard reset to certain commit
purgeTo() {
  git branch | grep -v "$1" | xargs git branch -D
}
# sync current branch with certain branch
rebaseTo() {
  git rebase "$1"
}