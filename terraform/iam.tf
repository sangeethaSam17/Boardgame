data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "instance" {
  name               = "eks-manager"
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
}

# ------------------------------------------------------------------------------
# AWS Managed Policy Attachments
# ------------------------------------------------------------------------------

resource "aws_iam_role_policy_attachment" "administrator_access" {
  role       = aws_iam_role.instance.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "ec2_full_access" {
  role       = aws_iam_role.instance.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "vpc_full_access" {
  role       = aws_iam_role.instance.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}