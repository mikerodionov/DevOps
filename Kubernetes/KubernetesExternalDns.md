# [Kubernetes ExternalDNS](https://github.com/kubernetes-sigs/external-dns)
 
```Bash
# Get ExternalDNS deployment policy
# --policy=upsert-only would prevent ExternalDNS from deleting any records, omit to enable full synchronization
# --policy=sync - will allow records deletion, can cause issues when DNS zone targeted by multiple instances of ExternalDNS
kubectl get deployment/external-dns-infra -n infra -o yaml | grep policy
```
