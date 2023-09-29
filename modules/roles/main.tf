resource "aws_iam_policy" "full_access_policy" {
  name        = var.policy_name
  description = var.policy_description

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:*",
          "ecr:*",
          "ecs:*",
        ],
        Effect   = "Allow",
        Resource = "*",
      },
    ],
  })
}

resource "aws_iam_role" "my_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com",
        },
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "full_access_attachment" {
  policy_arn = aws_iam_policy.full_access_policy.arn
  role       = aws_iam_role.my_role.name
  depends_on = [aws_iam_policy.full_access_policy, aws_iam_role.my_role]
}

resource "aws_iam_instance_profile" "profile" {
  name       = var.profile_name
  role       = aws_iam_role.my_role.name
  depends_on = [aws_iam_role.my_role]
}