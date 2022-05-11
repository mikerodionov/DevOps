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

Manage Swarm nodes

```Bash
docker node COMMAND
```

|Command|Description|
|---|---|
|demote|      Demote one or more nodes from manager in the swarm|
|inspect|    Display detailed information on one or more nodes|
|ls|          List nodes in the swarm|
|promote|     Promote one or more nodes to manager in the swarm|
|ps|          List tasks running on one or more nodes, defaults to current node|
|rm|          Remove one or more nodes from the swarm|
|update|      Update a node|
