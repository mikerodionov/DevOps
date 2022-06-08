# Kubernetes notes

## Delete namespace contents

```Bash
# Delete everything from default namespace
kubectl delete all --all
# Delete everything frp, specific namespace
kubectl delete all --all -n namespace_name
```
