#Role to be used for the Instances launched in ASG
resource "aws_iam_role" "iam_role" {
  name = "${var.environment}-${var.application}-iam-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "iam.amazonaws.com"
        }
      }
    ]
  })
  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-iam-role",
      Environment = var.environment,
      createdBy   = var.createdBy
      Application = var.application
    },
    var.tags
  )
}

#Applying policies to the new role via json files located in path 
resource "aws_iam_policy" "iam_policy" {
  name   = "${var.environment}-${var.application}-iam-policy"
  policy = file("${path.module}../../../environments/dev/iam-policies/alb-asg.json")
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.iam_policy.arn
}

resource "aws_iam_policy" "ssm_policy" {
  name   = "${var.environment}-${var.application}-ssm-policy"
  policy = file("${path.module}../../../environments/dev/iam-policies/ssm-ec2.json")
}

resource "aws_iam_role_policy_attachment" "ssm_role_policy_attachment" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.ssm_policy.arn
}