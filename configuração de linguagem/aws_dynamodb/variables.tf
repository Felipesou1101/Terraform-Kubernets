# variable "read_capacity" {
#     description = "The read capacity units for the DynamoDB table."
#     type        = number
#     default     = 5
# }

# variable "write_capacity" {
#     description = "The write capacity units for the DynamoDB table."
#     type        = number
#     default     = 5
# }

variable "dynamodb_objecy"{
    description = "Dynamodb objet"
    type = object({
        name = string
        read_capacity = optional(number, 5)
        write_capacity = optional(number, 5)
        description = optional(string, "Dynamodb table")
        hask_key = object({
            name = string
            type = string
        })
        range_key = object({
            name = string
            type = string
        })
    })
    default = {
        name = "basic-dynamodb-table"
        hash_key = {
            name = "UserId"
            type = "S"
        }
        range_key = {
            name = "Timestamp"
            type = "N"
        }
    }
}