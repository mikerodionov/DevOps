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

Swarm config folder (should be backed up):

```Bash
/var/lib/docker/swarm
```

This folder contains - certificates, docker-state.json, raft, state.json, worker

List Docker Swarm nodes:
```Bash
docker node ls
```
