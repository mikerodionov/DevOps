# This script adds owner to an app registration

# Settting app registration name
$app = "some_app_registration_name"

# Getting app registration ID based on name
$app_id = Get-AzADApplication -DisplayName $app | Select-Object -Expand "ApplicationId"

# Adding owner to app registration with specified ID, you need to add uses object ID
az ad app owner add --id $app_id --owner-object-id "user_object_id"