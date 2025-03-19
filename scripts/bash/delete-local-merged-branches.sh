  #!/bin/bash
  
  # Fetch latest changes from remote
  git fetch origin

  # Update local staging branch
  git checkout staging
  git pull origin staging

  # Get list of merged branches, excluding protected ones
  merged_branches=$(git branch --merged staging | grep -v -E "^\*|main|master|staging|develop")

  if [ -z "$merged_branches" ]; then
      echo "No merged branches found to delete"
      exit 0
  fi

  echo "The following branches will be deleted:"
  echo "$merged_branches"
  echo
  read -p "Continue? (y/n) " -n 1 -r
  echo

  if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo "$merged_branches" | xargs git branch -d
      echo "Branches have been deleted"
  else
      echo "Operation cancelled"
  fi