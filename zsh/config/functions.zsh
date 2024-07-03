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
copyNotes() {
  echo "📝 Copying notes"
  dest="$HOME/personal/notes/Axonify"
  origins=(
    "$HOME/Documents/Axonify"
  )
  for i in "${origins[@]}"; do
    echo "📝 Copying $i"
    cp -r "$i" "$dest"
  done
}
# backup 
backup() {
  echo "💾 Backing up"
  copyNotes
  # list of folders to backup
  folders=(
    "$HOME/personal/notes"
    "$HOME/dotfiles"
  )
 # current date
  date=$(date '+%Y-%m-%d')
 # for each item in a list of folders, commit and push
  for i in "${folders[@]}"; do
    echo "💾 Backing up $i"
    cd "$i" && git add . && git commit -m "💾 backup $date" && git push
  done
}