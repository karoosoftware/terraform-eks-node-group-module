output "node_group_id" {
  description = "Identifier of the EKS managed node group."
  value       = aws_eks_node_group.this.id
}

output "node_group_arn" {
  description = "ARN of the EKS managed node group."
  value       = aws_eks_node_group.this.arn
}

output "node_group_name" {
  description = "Name of the EKS managed node group."
  value       = aws_eks_node_group.this.node_group_name
}

output "cluster_name" {
  description = "Name of the EKS cluster the node group belongs to."
  value       = aws_eks_node_group.this.cluster_name
}

output "node_role_arn" {
  description = "IAM role ARN used by the EKS managed node group."
  value       = aws_eks_node_group.this.node_role_arn
}

output "node_group_status" {
  description = "Current status of the EKS managed node group."
  value       = aws_eks_node_group.this.status
}