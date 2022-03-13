# List RGs
az group list
# List files
ls -la
# Invoke built-in VC
. code simplestorage.bicep
# Build JSON from bicep
az bicep build -f simplestorage.bicep
. code simplestorage.json
cat simplestorage.json
rm -rf simplestorage.json
