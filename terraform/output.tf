output "public_ip" {
  value = aws_instance.eks_management_node.public_ip
}

output "public_dns" {
  value = aws_instance.eks_management_node.public_dns
}
