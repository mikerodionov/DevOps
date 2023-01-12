# Bash Prompt Customization Examples

```Bash
cat <<EOF >> ~/.bashrc
## Customizations
HOST='\[\033[02;36m\]\h'; HOST=' '$HOST
TIME='\[\033[01;31m\]\t \[\033[01;32m\]'
LOCATION='\[\e[1;92m\][\W]\[\e[33m\]'
BRANCH=' \[\033[00;33m\]$(parse_git_branch)\[\033[00m\]\n\$ '
PS1=$TIME$USER$HOST$LOCATION$BRANCH
EOF
```
