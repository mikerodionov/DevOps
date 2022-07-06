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
cat /etc/redhat-release
lsb_release -a
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
