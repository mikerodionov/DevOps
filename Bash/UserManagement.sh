# List users
cut -d: -f1 /etc/passwd
# List sudo users
grep '^sudo:.*$' /etc/group | cut -d: -f4
# View user's groups
groups username
# Create user & set password
adduser username
passwd username
# Change user's display name
sudo chfn -f "FirstName LastName" <username>
# Create group
groupadd groupname
# Add user to group
usermod -a -G examplegroup exampleusername
# Add user to sudo group
sudo usermod -aG sudo <username>
# Disable password expiration
chage -I -1 -m 0 -M 99999 -E -1 username
