# Infrastructure Code Rules

Applies to: `src/infra/**`

## Requirements
- Infrastructure as Code (Terraform/Pulumi)
- No manual changes to infrastructure
- Drift detection
- Secrets management
- Version-controlled

## Patterns
- Use modules for reusable components
- Use state files with locking
- Use workspaces for environments
- Document all infrastructure changes

## Anti-patterns
- Do not make manual changes to cloud resources
- Do not commit secrets to git
- Do not skip state file backups
