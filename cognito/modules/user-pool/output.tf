output "resource_server_scopes" {
  value = aws_cognito_resource_server.resource_server.scope_identifiers
}

output "user_pool_details" {
  value = aws_cognito_user_pool.user_pool.id
} 

output "user_pool_arn" {
  value = aws_cognito_user_pool.user_pool.arn
} 

