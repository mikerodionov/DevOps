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
# AlmaLinux
cat /etc/almalinux-release
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
# List users - CentOS 7
cut -d: -f1 /etc/passwd
# Change password
sudo passwd <USER_NAME>
```

## SSH

```Bash
# Check SSH Server version
ssh -v localhost
ssh -v

# Generate and use SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"
chmod 400 ~/.ssh/id_rsa # ser file permissions
# Run SSH agent
eval "$(ssh-agent -s)" # start the ssh-agent in the background
# Kill SSH agent
eval "$(ssh-agent -k)"
# If you don't manually kill it off, the agent will stay resident in your system, which introduces 2 potential problems
# 1) You will be spawning another ssh-agent processs every time you log in,  which bloats the process table although footprint is small
# 2) Each of those processes will have your unlocked private keys in their memory; if an attacker were to gain access to your system and exploit a hypothetical bug in either kernel memory management or the ssh-agent code itself he can potentially extract your private keys
```

## Navigating directories

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
# To return to the app - fg command (foreground)
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

## Truncating files

```Bash
# Truncate file/empty out log, -s 0 = set size to 0 (eleminate all contents)
truncate -s 0 hello.txt
```

## column command

```Bash
# Pipe output to mount for better readability
# -t to create table
mount | column -t
```

## Linux filesystem basics

```Bash
# View folder hierarchy/structure
tree / -L 1
# or use ls
ls /
# Conventional folders description
# /bin - dir which contains important executables and core OS commands
# in modern distributions this dir tends to be sym linked to usr/bin

# /boot - contains files needed by the bootloader, initial RAM file system and kernel

# /dev - contains device files which are dynamically created based on the various physical and virtual devices connnected to your system
# in Linux everything is a file or directory, including device
# nvme N - drive, pN - partition
ls -l /dev/nvme*

# /etc - contains configuration files and startup scripts
# e.g. SSH server config - /etc/ssh/sshd_config

# /home - individual user's files, by default that will be your terminal start directory
# ~ or /home/username
# this directory also contains configuration files specific to the user (.bashrc .config etc)

# /lib - holds shared libraries for system programs, shared libraries can be used by multiple programs
# depending on the system you may have multiple /lib directories - /lib32, /lib64
# frequently these dirs sym linked
# lib > /usr/lib
# lib64 > /usr/lib64

# /lost+found - contains chunks of broken files after system crash

# /media - mount point for FSs stored on removable media

# /mnt - mount point for temporary mounted devices (e.g. mount point for NAS etc.)

# /opt - rarely used nowaday, directory for optional software packages, mostly kept around for compatibility purposes

# /proc - pseudo file system which gets created at startup and disappears at shutdown, contains info about every running process on your machine, with each active process having its own subdirectory
# contains a lot of info about the system, e.g. CPU info
cat /proc/cpuinfo
man proc
# memory info
cat /proc/meminfo

# /root - root user home directory, accessible only as root user/with sudo

# /run - contains info describing your system since boot time such as who is logged in and what demons might be running

# /sbin - contains system essential files, similar to the bin, traditionally programs in sbin were statically linked, on modern systems there is little practical difference between bin and sbin
# /sbin is often sym linked to /usr/sbin on modern Linux versions

# /srv - used for files server by a web server or other server mecanisms such as FTP, rarely used nowadays (with openSUSE being notable exception which uses it as default for web servers)

# /sys - contains info about devices, drivers and kernel features, like /proc but better structured

# Check folder size
du -hs your_directory
```

## Reload .bashrc

```
# 3 options
source ~/.bashrc
. ~/.bashrc
exec bash
```

## Worknig with disks

```Bash
# View disks information
lsblk -o NAME,HCTL,SIZE,MOUNTPOINT | grep -i "sd"
# Check free space
df -h
# Look up for largest file / directory
du -a -h /var | sort -h -r | head -n 10
```
## grep

```Bash
# Search for pattern which starts from - hyphen
grep -- -X
tar --help | grep -- -f
```

## cat

```Bash
# Create multiline file
cat <<EOF > print.sh
#!/bin/bash
echo \$PWD
echo $PWD
EOF
```
