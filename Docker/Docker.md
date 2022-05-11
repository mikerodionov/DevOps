# Docker info & commands

List all containers:
```Bash
docker ps -a
```

Remove all containers:
```Bash
docker rm -f $(docker ps -a -q)
```

# Docker Swarm info & commands

Swarm config folder (should be backed up): /var/lib/docker/swarm
