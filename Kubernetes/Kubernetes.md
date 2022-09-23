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

## Work with configmaps

```Bash
# View configmap
kubectl describe configmaps <name>
```

## Work with secrets

```Bash
# View decoded K8s secret
kubectl get secret <SECRET_NAME> -o jsonpath="{.data.<DATA>}" | base64 --decode
```

## SSH into K8s pod

```Bash
kubectl exec -it pod_name -n namespace_name -- bash
```

## Get default/configured kubeconfig location 

```
# Display value of $KUBECONFIG if present, otherwise print default path
[[ ! -z "$KUBECONFIG" ]] && echo "$KUBECONFIG" || echo "$HOME/.kube/config"
```

## Evicted pods

```Bash
# List evicted pods in all namespaces
kubectl get pod -A | grep Evicted | awk '{print $2}'
# Delete all evicted pods in all namespaces
kubectl get ns | awk '{if (NR!=1) print $1}' | while read line; do
    # echo $line   
    kubectl get pod -n $line | grep Evicted | awk '{print $1}' | xargs kubectl delete pod -n $line
done
```

## Connect to AKS node using debug container

```Bash
kubectl get nodes
node=<NODE_NAME>
kubectl debug node/$node -it --image=mcr.microsoft.com/dotnet/runtime-deps:6.0
```
