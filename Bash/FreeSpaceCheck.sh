# Condition to check for required space in target directory
required_space=500
required_space_kb=$(($required_space*1024*1024))
free_space=$(df /dumps/DB-Dumps -k --output=avail | tail -1)
if [[ $free_space -lt $required_space_kb ]]; then
	echo "You have less than $required_space GB of free space in dumps folder, free up disk space and re-run this script"
	exit 1
fi;
