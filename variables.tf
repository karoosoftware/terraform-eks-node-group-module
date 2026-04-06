variable "node_role_name" {
  type        = string
  description = "Name of the IAM role used by the EKS managed node group."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs used by the EKS managed node group."
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster that the node group joins."
}

variable "desired_size" {
  type        = number
  description = "Desired number of nodes in the EKS managed node group."
}

variable "max_size" {
  type        = number
  description = "Maximum number of nodes in the EKS managed node group."
}

variable "min_size" {
  type        = number
  description = "Minimum number of nodes in the EKS managed node group."
}