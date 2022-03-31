## Initial config for commits
```
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"
# Verify
git config --list
```

## When you need to push creating remote branch

When remote branch not yet exist and you need to create if from local branch:

```
# Command below specify tracking branch on push
# -u is a short form of --set-upstream
git push -u origin master
```

## Delete remote branch
```
git push RemoteName --delete BranchName
# other option
git branch -d origin/BranchName -r
# to verify/list remote brances
git branch -r
# Once remote branch was deleted you need to propogate changes locally
# fectch - to download objects and refs from another repository/repositories
# --all - specifies to fetch all remotes
# --prune - specifies to remove any remote-tracking references that no longer exist on the remote before fetching
git fetch --all --prune
```

## Delete local branch
```
git branch -d local_branch_name
```

## To merge between main and working branch, pull main branch then switch to working and run (when working gets behing main)
```
git merge main

# Options when you receive - "Commit your changes or stash them before you can merge"
# Commit your local changes
git commit -m "My message"
# Stash your local changes - stashing acts as a stack, where you can push changes, and you pop them in reverse order
git stash
# If you used stash - then do the merge and then pull stash
git stash pop
# Discard local changes - option A
git reset --hard
# Discard local changes - option B
git checkout -t -f remote/branch
# Discard local changes for a specific file
git checkout filename
```
