## Flush DNS resolver cache

```Bash
# Older versions
sudo systemd-resolve --flush-caches
# Ubuntu 20.04, 22.04
resolvectl flush-caches
```

## Get IP address

```Bash
# Various commands to get system's IP address
ip a
ip addr
# ifconfig may need to be installed - sudo yum -y install net-tools
ifconfig
hostname -I
nmcli
ip route
```

## Check for active ssh sessions

```Bash
last -a | grep -i still
who
```
## Update DNS from DHCP

```Bash
# Command below will update /etc/resolv.conf
dhclient
cat /etc/resolv.conf
# If dhclient already running
sudo -Es
dhclient -r; dhclient
```
