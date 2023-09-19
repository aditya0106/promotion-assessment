variable "user-pool-name" {
  description = "User Pool Name"
  type        = string    
}


variable "app-domain-name" {
  description = "App Domain Name"
  type        = string    
}


variable "resource-server-name" {
  description = "Resource Server Name"
  type        = string    
}


variable "app-clients" {
  description = "App Client Names"
  type        = list    
}


variable "scopes" {
    type = any
    default = {
      scope1 = {
        "scope_name": "read"
        "scope_description": "Read user data"
      },
      scope2 = {
        "scope_name": "write"
        "scope_description": "Write user data"
      }
  }
}