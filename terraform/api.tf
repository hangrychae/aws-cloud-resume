# API Gateway
resource "aws_apigatewayv2_api" "visit-count-api" {
  	name        = "visit-count-api"
  	description = "Accepts requests from web app and return visitor count from dynamoDB"
  	protocol_type = "HTTP"
  	# target        = aws_lambda_function.lambda_function.arn
	disable_execute_api_endpoint = false
	cors_configuration {
    	allow_origins = ["*"]
    	allow_methods = ["*"]
	}
}



# Integration
resource "aws_apigatewayv2_integration" "visit-count-api" {
  api_id            = aws_apigatewayv2_api.visit-count-api.id
  integration_type  = "AWS_PROXY"

  connection_type           = "INTERNET"
  description               = "Lambda API Integration"
  integration_method        = "POST"
  integration_uri           = aws_lambda_function.lambda_function.invoke_arn
}


# route for getting count
resource "aws_apigatewayv2_route" "getCount" {
  api_id    = aws_apigatewayv2_api.visit-count-api.id
  route_key = "GET /getCount"
  target = "integrations/${aws_apigatewayv2_integration.visit-count-api.id}"
}

# stage
resource "aws_apigatewayv2_stage" "v1" {
  api_id      = aws_apigatewayv2_api.visit-count-api.id
  name        = "v1"
  description = "v1"
  auto_deploy = true
}

# Permission from lambda (resource-based policy) to api gateway get method
resource "aws_lambda_permission" "api_lambda_permission" {
    # statement_id  = "AllowExecutionFromAPIGateway"
	statement_id_prefix = "ExecuteByAPI"
    action        = "lambda:InvokeFunction"
    # function_name = aws_lambda_function.lambda_function.arn
	function_name       = aws_lambda_function.lambda_function.function_name
    principal     = "apigateway.amazonaws.com"
	source_arn    = "${aws_apigatewayv2_api.visit-count-api.execution_arn}/*/*/getCount"
}


