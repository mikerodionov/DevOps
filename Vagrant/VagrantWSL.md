# Vagrant WSL

- Install Windows Vagrant version matching WSL Vagrant version

- In case you getting error below when running vagrant up:
```
==> centos7: Waiting for machine to boot. This may take a few minutes...
The private key to connect to this box via SSH has invalid permissions
set on it. The permissions of the private key should be set to 0600, otherwise SSH will
ignore the key. Vagrant tried to do this automatically for you but failed. Please set the
permissions on the following file to 0600 and then try running this command again:

/mnt/c/vagrant/.vagrant/machines/centos7/virtualbox/private_key

Note that this error occurs after Vagrant automatically tries to
do this for you. The likely cause of this error is a lack of filesystem
permissions or even filesystem functionality. For example, if your
Vagrant data is on a USB stick, a common case is that chmod is
not supported. The key will need to be moved to a filesystem that
supports chmod
```
That happens when you run Vagrant from directory located on Windows volume mounted into WSL (/mnt/c), to resolve this add path to Vagrant directory into 

```Bash
# Add var for current session
export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH="/mnt/c/vagrant
# Add permanently
echo 'export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH="/mnt/c/vagrant' >> ~/.profile
```
