import boto3
import json

def lambda_handler(event, context):
    db_client = boto3.client('dynamodb')
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table("visitor-count-db")

    update = db_client.update_item(
        TableName="visitor-count-db",
        Key={"visit": {"S": "count"}},
        UpdateExpression="ADD qtx :inc",
        ExpressionAttributeValues = {":inc": {"N": "1"}},
        ReturnValues = 'UPDATED_NEW'
    )

    value = update['Attributes']['qtx']['N']

    response = {
        "headers": {
            "content-type" : "application/json"
        },
        "status_code": 200,
        "body" : {
            "count" : value
        }
    }

    return response
