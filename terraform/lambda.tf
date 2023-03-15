data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda_call.py"
  output_path = "lambda.zip"
}

resource "aws_lambda_function" "lambda_function" {
  filename      = "lambda.zip"
  function_name = "lambda_call"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_call.lambda_handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime = "python3.9"
}