# To delete remote branch
git push RemoteName --delete BranchName
# Wnen remote branch was deleted on GitHub/in Azure DevOps repo you will still need to delete your local branch
git branch -d local_branch_name
# Once remote branch was deleted you need to propogate changes locally
# fectch - to download objects and refs from another repository/repositories
# --all - specifies to fetch all remotes
# --prune - specifies to remove any remote-tracking references that no longer exist on the remote before fetching
git fetch --all --prune

# To merge between main and working branch, pull main branch then switch to working and run (when working gets behing main)
git merge main
