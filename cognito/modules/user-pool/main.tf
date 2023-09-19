resource "aws_cognito_user_pool" "user_pool" {
  name = "${var.user-pool-name}"
  mfa_configuration          = "ON"
  software_token_mfa_configuration {
    enabled = true
  }
}


resource "aws_cognito_user_pool_domain" "app_domain" {
  domain          = "${var.app-domain-name}"
  user_pool_id    = aws_cognito_user_pool.user_pool.id
}


resource "aws_cognito_resource_server" "resource_server" {
  identifier   = "${var.resource-server-name}"
  name         = "${var.resource-server-name}"
  user_pool_id = aws_cognito_user_pool.user_pool.id

  dynamic "scope" {
      for_each = [for key, value in var.scopes: {
        scope_name     = value.scope_name
        scope_description     = value.scope_description
      }]
	  
      content {
        scope_name     = scope.value.scope_name
        scope_description = scope.value.scope_description
      }
    }
}



resource "aws_cognito_user_pool_client" "app_client" {
  count = length(var.app-clients)
  name = var.app-clients[count.index]
  user_pool_id = aws_cognito_user_pool.user_pool.id
  generate_secret     = true
  explicit_auth_flows = ["ALLOW_CUSTOM_AUTH", "ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_SRP_AUTH"]
  supported_identity_providers = ["COGNITO"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows = ["client_credentials"]
  allowed_oauth_scopes = aws_cognito_resource_server.resource_server.scope_identifiers
}