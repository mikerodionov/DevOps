# minikube

[minikube](https://minikube.sigs.k8s.io/docs/) - quickly sets up a local Kubernetes cluster on macOS, Linux, and Windows.  Perfect option to learn kubectl.

```Bash
# Start with older version of K8s
# Note that minikube only supports the latest Kubernetes release +6 previous minor versions
# Older versions can be specified with --force flag, but there is no guarantee that everything will work
minikube start --kubernetes-version v1.15.0 --force
```

## Install/update

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

## Start with parameters

```Bash
minikube start --cpus=4 --memory=6g --nodes=1 --bootstrapper=kubeadm --container-runtime=containerd --kubernetes-version=stable
```
