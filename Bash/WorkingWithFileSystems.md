# Links

## Hardlink vs symbolic link

- A hard link points to the same bytes (inode) on disk, a soft link points to another file by filename.

```
# Creating and modifyig links with ln command
ln --help
man ln
# Create symlink
ln -nsf /target /link
# -f = force, forces replacement of existing link
# -n = no-difference = creates symlink as a link file, otherwise link will be created as a file inside of specified link dir /link
# -s = create symlink instead of hardlink
```
