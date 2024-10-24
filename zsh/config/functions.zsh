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
git:resetTo() {
  git reset --hard HEAD~"$1"
}
# git hard reset to certain commit
git:purgeTo() {
  git branch | grep -v "$1" | xargs git branch -D
}
# sync current branch with certain branch
git:rebaseTo() {
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

pruneLocalBranches() {
  # Colors for output
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  YELLOW='\033[1;33m'
  NC='\033[0m' # No Color

  # Function to print colored output
  print_message() {
      color=$1
      message=$2
      echo -e "${color}${message}${NC}"
  }

  # Check if we're in a git repository
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      print_message "$RED" "Error: Not a git repository"
      exit 1
  fi

  # Update staging branch
  print_message "$YELLOW" "Updating staging branch..."
  git checkout staging >/dev/null 2>&1 || { print_message "$RED" "Error: staging branch does not exist"; exit 1; }
  git pull origin staging

  # # Get current branch
  original_branch=$(git rev-parse --abbrev-ref HEAD)

  # # List branches to be deleted
  branches_to_delete=$(git branch --merged staging | grep -v "\*\|main\|staging" | sed 's/^[[:space:]]*//')

  # # Check if there are any branches to delete
  if [ -z "$branches_to_delete" ]; then
      print_message "$GREEN" "No merged branches to delete."
      exit 0
  fi

  # # Print branches that will be deleted
  # print_message "$YELLOW" "The following branches will be deleted:"
  # echo "$branches_to_delete"

  # # Prompt for confirmation
  # read -p "Do you want to proceed? (y/N) " -n 1 -r
  # echo
  # if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  #     print_message "$YELLOW" "Operation cancelled."
  #     exit 1
  # fi

  # # Delete branches
  # echo "$branches_to_delete" | while read branch; do
  #     if [ -n "$branch" ]; then
  #         if git branch -d "$branch" 2>/dev/null; then
  #             print_message "$GREEN" "Deleted branch: $branch"
  #         else
  #             print_message "$RED" "Failed to delete branch: $branch"
  #         fi
  #     fi
  # done

  # # Return to original branch
  # git checkout "$original_branch" >/dev/null 2>&1

  # print_message "$GREEN" "Branch cleanup completed!"
}