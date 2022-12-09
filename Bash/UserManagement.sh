# List users
cut -d: -f1 /etc/passwd
# List sudo users
grep '^sudo:.*$' /etc/group | cut -d: -f4
# Create user & set password
adduser username
passwd username
# Create group
groupadd groupname
# Add user to group
usermod -a -G examplegroup exampleusername
# Add user to sudo group
sudo usermod -aG sudo <username>
# View user's groups
groups username
# Get existing users
cut -d: -f1 /etc/passwd
# Disable password expiration
chage -I -1 -m 0 -M 99999 -E -1 username
