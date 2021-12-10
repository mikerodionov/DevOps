# Wnen remote branch was deleted on GitHub/in Azure DevOps repo you will still need to delete your local branch
git branch -d local_branch_name
# To merge between main and working branch, pull main branch then switch to working and run (when working gets behing main)
git merge main
