# Bash Basics

## Switch to root

```Bash
# Switch to root / will prompt password
su -
# Get root access, but maintain your current SHELL, which means that shell specific settings, including your current directory, are preserved; for instance if you use bash (Ubuntu's default shell), aliases (and any other settings from ~/.bashrc) are kept when you switch to the root user / no password prompt
sudo -s
# Leave root mode
exit
```

## Get Linux version

```Bash
# Ubuntu
cat /etc/lsb-release 
# CentOS
cat /etc/redhat-release # requires CentOS 6+
cat /etc/centos-release # requires CentOS 6+
rpm -q centos-linux-release # requires CentOS 6+ & centos-linux-release package
rpm -q centos-release # requires CentOS 6+
lsb_release -a # requires redhat-lsb package to be installed
rpm -E %{rhel} # RPM macro to get major version
```

## Grant execute permissions on sh script file

```Bash
chmod +x /path/to/yourscript.sh
```

## Run sh script

```Bash
./yourscript.sh
```

## Count number of lines in outoput

```Bash
# We can use wc -l OR grep "" -c
kubectl -n namespace_name get pods | wc -l
kubectl -n namespace_name get pods | grep "" -c
```

## Pipe output into cliplboard

```Bash
cat test.tx | xclip -sel clip
```
## User management

```Bash
# Delete user
sudo deluser user1
```

## SSH

```Bash
# Check SSH Server version
ssh -v localhost
ssh -v
```

## Navugatung directories

```Bash
# Go back to a previous directory
cd -
# Go to a home directory
cd ~
# pushd and popd - allow you to go back to directory you entered with pushd, or subsequent directories stored in stack
# to view stack of directories (history of dirs to which you navigated via popd) use
pushd /var
```

## Clear screen

```Bash
# Clear screen with CTRL+L (moves command prompt back to the top of the screen, you can still scroll up and see preceeding commands) or clear command preserving history
clear
# To reset shell and remove history
reset
```

## Minimizing an app (bacground/foreground)

```Bash
# Run program and go back to the same terminal leaving program running - CTRL + Z - that minimizes program to background
# To return to the app - fg command (foregroung)
# htop - utility to monitor system resources: htop CTRL + Z, fg
# If you close shell you will lose whatever is running in background
```

## Select all in nano

To select all in nano it is possible to use
- Ctrl+6 - to set a mark in the very beginning of a file
- Alt+T (or Alt+Shift+T) to cut to the end of the file
- Ctrl+U - to uncut content (but you should still be able to paste it)

## Repeating the last command with sudo

```Bash
# To repeat previous command with sudo
sudo !!
```

## Command history navigation

Ctrl + R - reverse search

```Bash
# Get a history of previously run commands
history
# ! + number to re-run command
!105
# Get a time when command was run
HISTTIMEFORMAT="%Y-%m-%d %T "
history
# To make variable permanent add it to ~/bashrc
HISTTIMEFORMAT="%Y-%m-%d %T "
# To make command not visible in history set variable & prepend command with space
HISTCONTROL=ignoreboth
```

## cmatrix

cmartix :), F11 & enjoy

## Font increase/decrease

Ctrl+Shift+Plus - increase
Ctrl+Minus - decrease

## Delete entire line

Ctrl + U - delete all
Ctrl + A - go to the beginning of the line
Ctrl + E - go to the end of the line

## Chaining commands together

```Bash
sudo apt update; sudo apt dist-upgrade
# with ; we run command one by one, with second one run even if first one fails
ls -l; echo "hello world"
# with && we run command one by one but second one won't run if the first one fails
ls -l && echo "hello world"
# To see the final part of the file and keep it updated as it changes - monitor tail of the log
# CTRL + C to cancel out
tail -f /var/log/syslog
```