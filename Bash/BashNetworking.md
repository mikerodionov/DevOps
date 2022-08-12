Flush DNS resolver cache

```Bash
# Older versions
sudo systemd-resolve --flush-caches
# Ubuntu 20.04, 22.04
resolvectl flush-caches
```
