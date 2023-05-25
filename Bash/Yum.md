# Yellowdog Updater, Modifed (YUM)

```
# When you getting an error "Another app is currently holding the yum lock"
# output of this error will contain PID of the application which holds the yum lock which yuo can use to kill it
kill -9 <PID>
# signal 9 is used to immediately terminate a process, without allowing it to clean up or save any data; this signal cannot be ignored by the process.
```
