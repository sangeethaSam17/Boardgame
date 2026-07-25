output "public_ip" {
  value = aws_instance.eks-manager.public_ip
}

output "public_dns" {
  value = aws_instance.eks-manager.public_dns
}
