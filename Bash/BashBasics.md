# Bash Basics

## Switch to root

```Bash
# Switch to root
su -
```

## Grant execute permissions on sh script file:

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
