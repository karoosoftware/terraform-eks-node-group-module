# AWS EKS Node Group Module

This module provides the foundational EKS worker node resources needed for an Amazon EKS managed node group, including the node group itself, the node IAM role, and the required managed policy attachments.

## What This Module Creates

- 1 EKS managed node group
- 1 IAM role for the worker nodes
- 1 IAM role policy attachment for `AmazonEKSWorkerNodePolicy`
- 1 IAM role policy attachment for `AmazonEC2ContainerRegistryPullOnly`
- 1 IAM role policy attachment for `AmazonEKS_CNI_Policy`

## Usage

```hcl
module "eks_node_group" {
  source = "git::ssh://git@github.com:karoosoftware/terraform-eks-node-group-module.git?ref=<commit-sha>"

  cluster_name   = module.eks_cluster.cluster_name
  node_role_name = "EKSNodeRoleMargana"
  subnet_ids     = ["subnet-013aa7153bc006bcb", "subnet-042f19f43474846bd"]
  desired_size   = 1
  max_size       = 1
  min_size       = 1
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `cluster_name` | Name of the EKS cluster that the node group joins. | `string` | n/a | yes |
| `node_role_name` | Name of the IAM role used by the EKS managed node group. | `string` | n/a | yes |
| `subnet_ids` | Subnet IDs used by the EKS managed node group. | `list(string)` | n/a | yes |
| `desired_size` | Desired number of nodes in the EKS managed node group. | `number` | n/a | yes |
| `max_size` | Maximum number of nodes in the EKS managed node group. | `number` | n/a | yes |
| `min_size` | Minimum number of nodes in the EKS managed node group. | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `node_group_id` | Identifier of the EKS managed node group |
| `node_group_arn` | ARN of the EKS managed node group |
| `node_group_name` | Name of the EKS managed node group |
| `cluster_name` | Name of the EKS cluster the node group belongs to |
| `node_role_arn` | IAM role ARN used by the EKS managed node group |
| `node_group_status` | Current status of the EKS managed node group |

## Notes

- This module manages EC2-backed EKS managed node groups only.
- This module expects the EKS cluster to already exist and be passed in by name.
- This module creates and manages the node IAM role and attaches the standard managed policies required for a basic EKS managed node group.
- This module expects existing subnets to be passed in by the caller.
- This module does not manage standalone EC2 instances, launch templates, or cluster networking.
- Fargate capacity should be managed separately with an EKS Fargate profile module rather than this module.

## Release Process

- Update the root `VERSION` file in the same change that should be released, using semantic versioning such as `1.0.1`, `1.1.0`, or `2.0.0`.
- Push the change to `develop` and let the `terraform-validate` workflow pass.
- Open a pull request from `develop` to `main` and let the `terraform-validate` workflow pass again.
- Merge the pull request to `main`.
- Pushing to `main` triggers the automated release workflow, which:
  - reads `VERSION`,
  - checks that tag `v<VERSION>` does not already exist,
  - creates and pushes the tag,
  - creates the GitHub release automatically.
- If `VERSION` has not been updated and the tag already exists, validation and release will fail.
- Consume released versions from other Terraform repos by pinning the module source with the released tag, for example:

```bash
source = "git::ssh://git@github.com:karoosoftware/terraform-eks-node-group-module.git?ref=v1.0.0"
```

## Prerequisites

- Terraform 1.5+
- AWS provider configured in the root module
- IAM permissions to create EKS managed node groups, IAM roles, and IAM policy attachments
- An existing EKS cluster
- Existing subnets suitable for EKS worker nodes
