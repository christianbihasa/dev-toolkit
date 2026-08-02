## Git Cheatsheet & Recovery Guide

### 1. Safety & Recovery (Undoing Things)

#### Undo Last Commit (Keep File Changes) 

```bash
git reset --soft HEAD~1
```

#### Discard All Uncommitted Local Changes

```bash
# Unstage staged files
git restore --staged .

# Discard all modified files
git restore .

# Delete all untracked files and directories
git clean -fd
```

#### Emergency Saver (if you accidentally deleted a branch, hard-reset by mistake, or lost commit.)

```bash
# 1. View history of HEAD positions
git reflog

# 2. Revert back to the state before the mistake (e.g., HEAD@{3})
git reset --hard HEAD@{3}
```

#### Change the Last Commit Message

```bash
git commit --amend -m "new commit message"
```

### 2. Branching & Cleanup

#### Rename Current Branch

```bash
git branch -M new-branch-name
```

#### Delete Local & Remote Branches

```bash
# Delete local branch
git branch -d branch-name

# Force delete local branch (if unmerged)
git branch -D branch-name

# Delete remote branch
git push origin --delete branch-name
```

#### Prune Stale Remote Tracking Branches (Clean up local references to branches that were deleted on GitHub)

```bash
git fetch --prune
```

### 3. Stashing Quick References

```bash
# Stash untracked and tracked files with a clear label
git stash save -u "work in progress on auth flow"

# List stashes
git stash list

# Apply most recent stash and remove it from list
git stash pop

# Apply specific stash without removing it
git stash apply stash@{1}
```