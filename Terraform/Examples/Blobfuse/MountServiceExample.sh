cat << EOF > /opt/blobfusemount-start.sh
#!/bin/bash
mount | awk '{if (\$3 == "/mnt/data/logs") { exit 0}} ENDFILE{exit -1}' && sudo umount /mnt/data/logs
blobfuse /mnt/data/logs --tmp-path=/mnt/resource/blobfusetmp  --config-file=/etc/fuse_connection.cfg -o attr_timeout=240 -o entry_timeout=240 -o negative_timeout=120
EOF
chmod u+x /opt/blobfusemount-start.sh

cat << EOF > /opt/blobfusemount-stop.sh
#!/bin/bash
mount | awk '{if (\$3 == "/mnt/data/logs") { exit 0}} ENDFILE{exit -1}' && sudo umount /mnt/data/logs
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
