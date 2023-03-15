resource "aws_dynamodb_table" "visitor-count-db" {
  name           = "visitor-count-db"
  billing_mode   = "PAY_PER_REQUEST"
#   read_capacity  = 1   -> only possible when provisioned
#   write_capacity = 1
  hash_key       = "visit"
  attribute {
    name = "visit"
    type = "S"
  }

#   global_secondary_index {
#     name               = "id"
#     hash_key           = "visit"
#     # write_capacity     = 1
#     # read_capacity      = 1
#     projection_type    = "KEYS_ONLY"
#   }

}

resource "aws_dynamodb_table_item" "table_item" {
  	table_name = aws_dynamodb_table.visitor-count-db.name
  	hash_key   = aws_dynamodb_table.visitor-count-db.hash_key

  	item = <<ITEM
	{
  	"visit": {"S": "count"},
  	"qtx": {"N": "135"}
	}
	ITEM
}

