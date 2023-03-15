# lambda assume role
resource "aws_iam_role" "lambda_role" {
    name = "lambda_role"
	assume_role_policy = jsonencode({
   "Version" : "2012-10-17",
   "Statement" : [
     {
       "Effect" : "Allow",
       "Principal" : {
         "Service" : "lambda.amazonaws.com"
       },
       "Action" : "sts:AssumeRole"
     }
   ]
  })
}


# lambda execution role and dynamo access policy 
# resource "aws_iam_role_policy_attachment" "lambda_policy" {
resource "aws_iam_role_policy_attachment" "lambda_execution_role" {
   role = aws_iam_role.lambda_role.name
   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


#lambda dynamodb access policy 
# resource "aws_iam_role_policy" "dynamodb-lambda-policy" {
resource "aws_iam_role_policy_attachment" "dynamodb-lambda-policy" {
#    name = "dynamodb_lambda_policy"
   role = aws_iam_role.lambda_role.id
   policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
#    policy = jsonencode({
#       "Version" : "2012-10-17",
#       "Statement" : [
#         {
#            "Effect" : "Allow",
#            "Action" : [
# 			   "dynamodb:GetItem", 
# 			   "dynamodb:PutItem"
# 			],
#            "Resource" : "${aws_dynamodb_table.visitor-count-db.arn}"
#         }
#       ]
#    })
}

