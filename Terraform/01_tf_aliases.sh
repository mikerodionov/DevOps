# Bash aliases for Terraform
# To add them permanently append to ~/.bashrc
alias tf='terraform'
alias tfa='time terraform apply && say "Terraform has completed"' # The 'say' command may not be available on all *nix systems.
alias tfd='terraform-docs'  # 'terraform-docs' command generates documentation from your TF code
alias tfg='terraform graph -draw-cycles | dot -Tpng > graph.png; open graph.png'
alias tfi='terraform init --upgrade'
alias tfp='echo running terraform get update then plan; terraform get -update && terraform plan -out /tmp/zplan'
alias tfv='terraform validate'
