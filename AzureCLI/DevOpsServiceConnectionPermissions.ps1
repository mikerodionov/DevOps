$projectName = '%DevOps_Project_Name%'
$groupname = '%DevOps_Project_Group%'
$namespace = '%Namespace_GUID%' # Namespace GUID

$Project = az devops project list --query "value[?name=='$projectName'].{name:name,ID:id}"
$projectId = ($Project | ConvertFrom-Json ).id
$group = az devops security group list --scope project --project $projectName --query "graphGroups[?displayName=='$groupName']"
$descriptor = ($group | ConvertFrom-Json).descriptor
$token = 'endpoints/{0}' -f $projectId

# Set Project Permissions
az devops security permission update `
--deny-bit 6 `
--allow-bit 8 `
--namespace-id $namespace `
--subject $descriptor `
--token $token  `
--merge true `
--output table
