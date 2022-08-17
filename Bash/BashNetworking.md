## Flush DNS resolver cache

```Bash
# Older versions
sudo systemd-resolve --flush-caches
# Ubuntu 20.04, 22.04
resolvectl flush-caches
```

## Get IP address

```Bash
ip a
ip addr
# ifconfig may need to be installed - sudo yum -y install net-tools
ifconfig
hostname -I
nmcli
ip route
```
