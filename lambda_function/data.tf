data "aws_iam_policy_document" "iam_assume_role_policy_document" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals{
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com"
      ]
    }
  }
}
