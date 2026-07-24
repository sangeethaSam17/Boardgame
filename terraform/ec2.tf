data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "eks-manager" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.test_profile.name
  key_name = aws_key_pair.eks-manager.key_name
  tags = {
    Name = var.instance_name
  }

}
resource "aws_iam_instance_profile" "test_profile" {
  name = "eks-role"
  role = aws_iam_role.instance.name
}

resource "aws_key_pair" "eks-manager" {
  key_name   = var.key_name
  public_key = file(${path.module}/keys/eks-manager.pub)