```Bash
# Check service's user context
# CentOS 7.5 - do not display user in output of systemctl status <service-name>, has to be queried via ps
systemctl status <service-name> | grep "Main PID"
ps -o user -p <PID>

# Check the process associated with the yum lock file:
ps -p $(cat /var/run/yum.pid)
# Kill the process
sudo kill <PID>
# If process is no longer active it is possible to delete lock file
sudo rm /var/run/yum.pid
```
