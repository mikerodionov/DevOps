# Kubernetes notes

## Delete namespace contents

```Bash
# Delete everything from default namespace
kubectl delete all --all
# Delete everything frp, specific namespace
kubectl delete all --all -n namespace_name
```

## Delete all namespaces

```Bash
# Command below will delete all AKS namespaces except default, kube-public, kube-system
kubectl delete namespace $(kubectl get namespaces --no-headers=true | awk {'print $1'})
```
