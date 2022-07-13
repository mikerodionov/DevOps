# Install blob fuse
sudo rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
yum install blobfuse -y
# Create directories
chown -R root:logreaders /mnt/data/blobfusetmp
chown -R root:logreaders /mnt/data/logs
chmod -R 770 /mnt/data/blobfusetmp
chmod -R 770 /mnt/data/logs
# Service to mount/unmount container
# -allow_other flag is used to ensure that not only owner will be able to access mounted files (otherwise root only will have access)
cat << EOF > /opt/blobfusemount-start.sh
#!/bin/bash
mount | awk '{if (\$3 == "/mnt/data/logs") { exit 0}} ENDFILE{exit -1}' && fusermount -u /mnt/logs /mnt/data/logs
blobfuse /mnt/logs --tmp-path=/mnt/data/blobfusetmp  --config-file=/etc/fuse_connection.cfg -o attr_timeout=240 -o entry_timeout=240 -o negative_timeout=120 -allow_other
EOF
chmod u+x /opt/blobfusemount-start.sh

cat << EOF > /opt/blobfusemount-stop.sh
#!/bin/bash
mount | awk '{if (\$3 == "/mnt/data/logs") { exit 0}} ENDFILE{exit -1}' && fusermount -u /mnt/logs
EOF
chmod u+x /opt/blobfusemount-stop.sh

cat << EOF > /etc/systemd/system/blobfusemount.service
[Unit]
Description=Azure blobfuse mount service
After=network.target
After=systemd-user-sessions.service
After=network-online.target

[Service]
ExecStart=/opt/blobfusemount-start.sh
ExectStop=/opt/blobfusemount-stop.sh
ExecReload=/opt/blobfusemount-start.sh
Type=simple
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

# Start service & enable run on system startup
sudo systemctl start blobfusemount
sudo systemctl enable blobfusemount
