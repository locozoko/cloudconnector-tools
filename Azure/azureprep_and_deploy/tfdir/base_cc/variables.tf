# azure variables

variable "arm_location" {
  description = "The Azure location."
  default     = "westus2"
}

variable "name_prefix" {
  description = "The name prefix for all your resources"
  default     = "zs"
  type        = string
}

variable "network_address_space" {
  description = "VNET CIDR"
  default     = "10.1.0.0/16"
}

variable "cc_subnet" {
  description = "Cloud Connector Subnet"
  default     = "10.1.100.0/24"
}

variable "environment" {
  description = "Environment"
  default     = "Development"
}

variable "subnet_count" {
  description = "Default number of worker subnets to create"
  default     = 1
}

variable "server_admin_username" {
  default   = "ubuntu"
  type      = string
}

variable "tls_key_algorithm" {
  default   = "RSA"
  type      = string
}

variable "cc_vm_managed_identity_name" {
  description = "Azure Managed Identity name to attach to the CC VM. E.g zspreview-66117-mi"
  type      = string
}

variable "cc_vm_managed_identity_resource_group" {
  description = "Resource Group of the Azure Managed Identity name to attach to the CC VM. E.g. edgeconnector_rg_1"
  type      = string
}

variable "byo_pip_address" {
  default     = false
  type        = bool
  description = "Bring your own Azure Public IP address for the NAT GW"
}

variable "byo_pip_name" {
  default     = ""
  type        = string
  description = "User provided Azure Public IP address name for the NAT GW"
}

variable "byo_pip_rg" {
  default     = ""
  type        = string
  description = "User provided Azure Public IP address resource group for the NAT GW"
}

variable "cc_vm_prov_url" {
  description = "Zscaler Cloud Connector Provisioning URL"
  type        = string
}

variable "azure_vault_url" {
  description = "Azure Vault URL"
  type        = string
}

variable "ccvm_image_publisher" {
  description = "Azure Marketplace Cloud Connector Image Publisher"
  default     = "zscaler1579058425289"
}

variable "ccvm_image_offer" {
  description = "Azure Marketplace Cloud Connector Image Offer"
  default     = "zia_cloud_connector"
}

variable "ccvm_image_sku" {
  description = "Azure Marketplace Cloud Connector Image SKU"
  default     = "zs_ser_cc_03"
}

variable "ccvm_image_version" {
  description = "Azure Marketplace Cloud Connector Image Version"
  default     = "latest"
}

variable "ccvm_instance_size" {
  description = "Cloud Connector Image size"
  default     = "Standard_D2s_v3"
  validation {
          condition     = ( 
            var.ccvm_instance_size == "Standard_D2s_v3"
          )
          error_message = "Input ccvm_instance_size must be set to an approved vm size."
      }
}

variable "http_probe_port" {
  description = "port for Cloud Connector cloud init to enable listener port for HTTP probe from LB"
  default = 0
  validation {
          condition     = (
            var.http_probe_port == 0 ||
            var.http_probe_port == 80 ||
          ( var.http_probe_port >= 1024 && var.http_probe_port <= 65535 )
        )
          error_message = "Input http_probe_port must be set to a single value of 80 or any number between 1024-65535."
      }
}

variable "vm_count" {
  description = "number of Workload VMs to deploy"
  type    = number
  default = 2
   validation {
          condition     = var.vm_count >= 1 && var.vm_count <= 250
          error_message = "Input vm_count must be a whole number between 1 and 9."
        }
}