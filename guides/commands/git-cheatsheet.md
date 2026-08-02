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
