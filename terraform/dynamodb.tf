resource "aws_dynamodb_table" "visitor-count-db" {
  name           = "visitor-count-db"
  billing_mode   = "PAY_PER_REQUEST"
#   read_capacity  = 1   ->  possible when provisioned
#   write_capacity = 1   ->  possible when provisioned
  hash_key       = "visit"
  attribute {
    name = "visit"
    type = "S"
  }
}


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

