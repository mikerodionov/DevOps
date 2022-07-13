# Create user & set password
adduser username
passwd username
# Create group
groupadd -g Group_ID Group_Name
# Add user to group
usermod -a -G examplegroup exampleusername
# View user's groups
 groups username
