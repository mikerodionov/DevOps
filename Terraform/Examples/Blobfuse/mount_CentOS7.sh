sudo -s
sudo rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
yum install blobfuse fuse -y

cat << EOF > /etc/fuse_connection.cfg
accountName blobfusemount202207
authType MSI
containerName logs
EOF

cat << EOF > /etc/rc.local
#!/bin/bash
blobfuse /usr/logs --tmp-path=/mnt/resource/blobfusetmp  --config-file=/etc/fuse_connection.cfg -o attr_timeout=240 -o entry_timeout=240 -o negative_timeout=120
exit 0
EOF

mkdir /usr/logs
addgroup logreaders
useradd logreader
chown -R logreader:logreaders /usr/logs
chmod -R 650 /usr/logs

sudo chmod 775 /etc/rc.local
# useradd -m -p P@ssw0rd -s /bin/bash logreader
sudo systemctl enable rc-local.service
# sudo systemctl start rc-local.service
exit 0
