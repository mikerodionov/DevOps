# Create user & set password
adduser username
passwd username
# Create group
groupadd groupname
# Add user to group
usermod -a -G examplegroup exampleusername
# View user's groups
groups username
