@'
import sys

message = sys.stdin.read()
lines = message.splitlines(keepends=True)

sys.stdout.write("".join(
    line for line in lines
    if not line.strip().startswith("Co-Authored-By:")
))
'@ | Set-Content -Encoding utf8 clean-message.py

# Run after to remove co-authors from the last 20 commits
# $script = (Resolve-Path .\clean-message.py).Path; git filter-branch -f --msg-filter "python '$($script -replace '\\','/')'" HEAD~20..HEAD

# Run after to verify if Co-author lines are removed
# git log -100 --format="%h %s%n%b" | Select-String "Co-Authored-By:"

# Finish with:
# git push --force-with-lease

# If it fails, do:
# git fetch origin
# git push --force-with-lease origin main