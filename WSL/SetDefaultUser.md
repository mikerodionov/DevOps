# Setting default user for WSL Ubuntu

Use wsl --list command to see what WSL distribution you have installed. It may return Ubuntu-22.04 or some other version you may have installed. Alternatively you can run the following from WSL Ubuntu terminal session to get your Ubuntu version:

```Bash
grep "DISTRIB_RELEASE=" /etc/lsb-release | grep -E [0-9]{2}.[0-9]{2} -o
```

This is also a way to switch to WSL root user.

Having Ubuntu version clarified run the command below from Windows CMD to set your default user, making sure that replacing 2204 to the specific version you have (obtained using commands above):

```Bash
ubuntu2204 config --default-user <username>
```
