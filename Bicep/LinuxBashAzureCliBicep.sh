# Install Azure CLI
sudo apt install azure-cli
# Check version
az version
az --help

# Install Bicep
# Fetch the latest Bicep CLI binary
curl -Lo bicep https://github.com/Azure/bicep/releases/latest/download/bicep-linux-x64
# Mark it as executable
chmod +x ./bicep
# Add bicep to your PATH (requires admin)
sudo mv ./bicep /usr/local/bin/bicep
# Verify you can now access the 'bicep' command

# Work with Bicep
bicep --help
bicep --version
