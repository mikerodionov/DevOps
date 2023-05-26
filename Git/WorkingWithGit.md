## Installing Git

```Bash
# Build and install specific version of Git - CentOS 7.5
cd ~
sudo yum update
sudo yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel autoconf gcc
wget https://www.kernel.org/pub/software/scm/git/git-2.31.0.tar.gz
tar -xf git-2.31.0.tar.gz
cd git-2.31.0
make configure
./configure --prefix=/usr/local
make all
sudo make install
git --version
```

## Essential commands

```Bash
# Check remote URL for repo you working with
# Just URL
git config --get remote.origin.url
# Full output
git remote show origin

# View / Switch branch
git branch # view branches
git checkout <existing_branch> # switch to existing branch
git checkout -b <new_branch> # create a new branch and switch to it

# Delete branch
git branch -d <local_branch_name> # delete branch locally
git push origin --delete <remote_branch_name> # delete remote branch

# Set upstream for local branch
git branch --set-upstream-to origin/master
```

## Initial config for commits
```
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"
# Verify
git config --list
```

## Working with branches

### When you need to push creating remote branch

When remote branch not yet exist and you need to create if from local branch:

```
# Command below specify tracking branch on push
# -u is a short form of --set-upstream
git push -u origin master
```

### Delete remote branch
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

### Delete local branch
```
git branch -d local_branch_name
```

### Synchronize branch list

```
git fetch -p
```

### To merge between main and working branch, pull main branch then switch to working and run (when working gets behing main)
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

## View remote repo URL

```Bash
git config --get remote.origin.url
# When Git keeps prompting for password after adding SSH public key in GitHub it may means that your origin is configured to use HTTPS
git remote -v # verify used URL
git remote set-url origin git@github.com:yourname/yourrepo.git # set correct URL
```
## Git update forked repo from original source

```Bash
# Add remote as upstream
git remote add upstream https://github.com/whoever/whatever.git
# Fetch all the branches of that remote into remote-tracking branches
git fetch upstream
# Make sure that you're on your master branch:
git checkout master
# Rewrite your master branch so that any commits of yours that
# aren't already in upstream/master are replayed on top of that
# other branch:
git rebase upstream/master
# OR to avoid rewriting history of your master branch
git merge upstream/master
```
## Cancel git rebase

```Bash
git rebase --abort
```

## Restore file which has been deleted with no commit

```Bash
# Work regardless of whether the deletion was staged or not
git checkout HEAD <filename>
```

## Using sparse-checkout

```
# Useful when working with very big repo/mono-repo, so that you touch/pull only selected directories
mkdir your-repo-dir
cd your-repo-dir
git init
git remote add -f origin ssh://repo_url.git
git sparse-checkout init
git sparse-checkout set directory1 direcotry2 # to set specific directories you want to work with
git sparse-checkout list # to confirm added directories
git pull origin master
```
