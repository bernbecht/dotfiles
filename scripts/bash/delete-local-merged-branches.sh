#!/bin/bash

# Colors for better visual feedback
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions for logging
log_header() {
  echo "\n${BLUE}=== $1 ===${NC}"
}

log_success() {
  echo "${GREEN}✓ $1${NC}"
}

log_info() {
  echo "${YELLOW}→ $1${NC}"
}

log_warning() {
  echo "${YELLOW}⚠ $1${NC}"
}

log_error() {
  echo "${RED}✗ $1${NC}"
}

# Script header
echo "${BLUE}"
echo "╔════════════════════════════════════════════╗"
echo "║  Delete Local Merged Branches              ║"
echo "╚════════════════════════════════════════════╝"
echo "${NC}"

# Fetch latest changes from remote
log_header "UPDATING REPOSITORY"
log_info "Fetching latest changes from remote..."
git fetch origin
log_success "Remote changes fetched"

# Update local staging branch
log_info "Updating local staging branch..."
git checkout staging
git pull origin staging
log_success "Staging branch updated"

# Get list of merged branches, excluding protected ones
log_header "FINDING MERGED BRANCHES"
log_info "Scanning for branches merged into staging..."
merged_branches=$(git branch --merged staging | grep -v -E "^\*|main|master|staging|develop")

if [ -z "$merged_branches" ]; then
    log_warning "No merged branches found to delete"
    exit 0
fi

# Count branches
branch_count=$(echo "$merged_branches" | wc -l | tr -d ' ')
log_success "Found ${branch_count} merged branch(es) that can be deleted"

log_header "BRANCHES TO DELETE"
echo "${YELLOW}$merged_branches${NC}"
echo

read -p "$(echo ${YELLOW}"Continue with deletion? (y/n) "${NC})" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    log_header "DELETING BRANCHES"
    deleted_count=0
    
    while IFS= read -r branch; do
        if [ -z "$branch" ]; then
            continue
        fi
        branch_trimmed=$(echo "$branch" | xargs)
        log_info "Deleting branch: $branch_trimmed"
        git branch -d "$branch_trimmed"
        if [ $? -eq 0 ]; then
            ((deleted_count++))
        else
            log_error "Failed to delete branch: $branch_trimmed"
        fi
    done <<< "$merged_branches"
    
    log_header "SUMMARY"
    log_success "Operation complete: ${deleted_count}/${branch_count} branches deleted"
else
    log_warning "Operation cancelled by user"
fi