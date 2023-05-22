```Bash
# Check service's user context
# CentOS 7.5 - do not display user in output of systemctl status <service-name>, has to be queried via ps
systemctl status <service-name> | grep "Main PID"
ps -o user -p <PID>
```
