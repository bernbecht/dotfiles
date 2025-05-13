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
  # Colors for better visual feedback
  GREEN='\033[0;32m'
  YELLOW='\033[1;33m'
  RED='\033[0;31m'
  BLUE='\033[0;34m'
  NC='\033[0m' # No Color

  # Helper functions for logging
  # Prefixed with _ to avoid potential conflicts with other functions
  _log_header() {
    echo -e "\n${BLUE}=== $1 ===${NC}"
  }

  _log_success() {
    echo -e "${GREEN}✓ $1${NC}"
  }

  _log_info() {
    echo -e "${YELLOW}→ $1${NC}"
  }

  _log_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
  }

  _log_error() {
    echo -e "${RED}✗ $1${NC}"
  }

  _log_header "STARTING BACKUP PROCESS"

  # copyNotes # Assuming this is a custom function you might have

  # list of folders to backup
  folders=(
    "$HOME/personal/notes"
    "$HOME/dotfiles"
  )

  # current date
  current_date=$(date '+%Y-%m-%d')

  # for each item in a list of folders, commit and push
  for folder_path in "${folders[@]}"; do
    _log_header "Backing up $folder_path"
    if [ ! -d "$folder_path" ]; then
      _log_error "Directory not found: $folder_path. Skipping."
      continue
    fi

    if [ ! -d "$folder_path/.git" ]; then
        _log_error "Not a git repository: $folder_path. Skipping."
        continue
    fi

    # Attempt to change directory, and log error if it fails
    cd "$folder_path" || {
      _log_error "Failed to change directory to $folder_path. Skipping."
      continue
    }

    _log_info "Adding all changes..."
    git add .
    if [ $? -ne 0 ]; then
        _log_error "git add failed in $folder_path"
        # Attempt to go back to the previous directory safely
        cd - > /dev/null 2>&1 || _log_warning "Could not return to previous directory from $folder_path"
        continue
    fi

    _log_info "Committing changes with message: '💾 backup $current_date'..."
    git commit -m "💾 backup $current_date"
    commit_status=$? # Capture commit status

    if [ $commit_status -eq 0 ]; then
      _log_success "Commit successful"
      _log_info "Pushing changes to remote..."
      git push
      if [ $? -eq 0 ]; then
        _log_success "Push successful for $folder_path"
      else
        _log_error "Push failed for $folder_path"
      fi
    # Check if commit failed because there were no changes
    elif git diff --quiet && git diff --staged --quiet; then
        _log_warning "No changes to commit in $folder_path"
    else
        # Commit failed for other reasons
        _log_error "Commit failed in $folder_path (Status: $commit_status)"
    fi
    
    # Go back to previous directory silently
    cd - > /dev/null 2>&1 || _log_warning "Could not return to previous directory from $folder_path"
  done
  _log_header "BACKUP PROCESS COMPLETE"
}
