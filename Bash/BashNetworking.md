Flush DNS resolver cache

```Bash
# Olderv versions
sudo systemd-resolve --flush-caches
# Ubuntu 20.04, 22.04
resolvectl flush-caches
```
