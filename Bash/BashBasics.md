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
