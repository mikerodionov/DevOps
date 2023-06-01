# Kernel Related Notes

```Bash
## Check kernel version on CentOS
uname -s -r
uname -msr

## Update kernel Centos 7
# Update packagses lisst and install fastest mirror plugin
yum update
yum -y install yum-plugin-fastestmirror

# Check kernel version
cat /etc/redhat-release
cat /etc/os-release
uname -snr

# Add ELRepo Repository, you can check repos with yum repolist
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm

# Install New CentOS Kernel Version
yum --enablerepo=elrepo-kernel install kernel-ml

# Check all available kernel versions in the Grub2 with awk
awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
# Set latest Kernel as default, assuming it has ID = 0
sudo grub2-set-default 0

# Generate the grub2 config with 'gurb2-mkconfig'
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo reboot

# Verify Kernel version
uname -snr
```
