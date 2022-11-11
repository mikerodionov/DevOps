## Upgrade control plane/master node

```Bash
az aks upgrade \
 --resource-group <RG name> \
 --name <AKS cluster name> \
 --kubernetes-version <target K8s version> \
 --control-plane-only
```
