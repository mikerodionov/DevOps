# List users
cut -d: -f1 /etc/passwd
# Create user & set password
adduser username
passwd username
# Create group
groupadd groupname
# Add user to group
usermod -a -G examplegroup exampleusername
# View user's groups
groups username
# Get existing users
cut -d: -f1 /etc/passwd
# Disable password expiration
chage -I -1 -m 0 -M 99999 -E -1 username
