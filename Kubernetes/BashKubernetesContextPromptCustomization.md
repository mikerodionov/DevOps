To change Bash prompt to [Current Path] [GitBranch] [Kubernetes Context] execute below code or add it to the end of ~/.bashrc to make this change permanent:

```Bash
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

k8s_info() {
  kubectl config view --minify --output 'jsonpath={..namespace}@{.current-context}' 2> /dev/null
}

## Customizations
PS1="\[\e[1;92m\][\w]\[\e[33m\]\$(parse_git_branch) \[\e[01;33m\][\$(k8s_info)]\[\e[34m\] $>\[\e[96m\] "
```

Option B

```Bash
## Customizations
HOST='\[\033[02;36m\]\h'; HOST=' '$HOST
TIME='\[\033[01;31m\]\t \[\033[01;32m\]'
LOCATION='\[\e[1;92m\][\W]\[\e[33m\]'
BRANCH=' \[\033[00;33m\]$(parse_git_branch)\[\033[00m\]\n\$ '
PS1=$TIME$USER$HOST$LOCATION$BRANCH
```
