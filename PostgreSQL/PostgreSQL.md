# PostgreSQL

```Bash
# View configuration
pg_config
# Locate pg_config
locate bin/postgres # if postgres or pg_config can't be run without specifying full path use this to identify full path
# Check version
postgres -V
postgres --v
# Check user used by PostgeSQL on CentOS 7.5
# Option A
systemctl show -p User postgresql-15
# Option B
systemctl status postgresql-15 | grep "Main PID"
ps -o user -p <PID>
# Check port used by PostgeSQL
# First confirm data directory
sudo -u postgres psql -c "SHOW data_directory;"
# Then inspect config file
sudo cat <data_directory>/postgresql.conf | grep -i port
# If you see #port = 5432 then default port 5432 is used
```
