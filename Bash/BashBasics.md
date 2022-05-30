# Bash Basics

Grant execute permissions on sh script file:

```Bash
chmod +x /path/to/yourscript.sh
```

Run sh script

```Bash
./yourscript.sh
```

Count number of lines in outoput - wc -l OR grep "" -c

```Bash
kubectl -n namespace_name get pods | wc -l
kubectl -n namespace_name get pods | grep "" -c
```
