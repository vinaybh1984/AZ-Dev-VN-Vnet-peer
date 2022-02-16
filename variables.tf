
provider "azurerm" {
   subscription_id = "${var.subscription_id}"
   client_id       = "${var.client_id}"
   client_secret   = "${var.client_secret}"
   tenant_id       = "${var.tenant_id}"
 features {}
    }


variable "subscription_id" {
  description = "Enter subscription ID"
}

variable "client_id" {
  description= "Enter Client ID"
}

variable "client_secret" {
  description = "Enter Client secret for Subscription in AZ-AD"
}

variable "tenant_id" {
  description = "Enter tenant ID"
}


