# Install required module
Install-Module -Name VSTeam -Scope CurrentUser
# Specify your Azure DevOps project
Set-VSTeamAccount -Account <Name of your Azure DevOps org> -PersonalAccessToken <Your PAT with access to your project>
# Request pipeline validation:
Test-VSTeamYamlPipeline -Project <PROJECT_NAME> -PipelineId <PIPELINE_ID> -FilePath '<PATH_TO_YAML_FILE>'
