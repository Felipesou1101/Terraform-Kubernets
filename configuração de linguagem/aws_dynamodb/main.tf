resource "aws_dynamodb_table" "basic-dynamodb-table" {
    name            = var.dynamodb_objecy.name
    billing_mode    = "PAY_PER_REQUEST"
    read_capacity   = var.dynamodb_objecy.read_capacity
    write_capacity  = var.dynamodb_objecy.write_capacity
    hash_key        = var.dynamodb_objecy.hash_key.name
    range_key       = var.dynamodb_objecy.sort_key.name

    attribute {
        name = var.dynamodb_objecy.hash_key.name
        type = var.dynamodb_objecy.hash_key.type
    }

    attribute {
        name = var.dynamodb_objecy.sort_key.name
        type = var.dynamodb_objecy.sort_key.type
    }
}