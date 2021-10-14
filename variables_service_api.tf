# ------------------------------------------------------------------------------
# Ethereum Indexer API
# ------------------------------------------------------------------------------
variable "api_instance_count" {
  type        = number
  description = "The number of instances to run."
  default     = 2
}

variable "api_image_registry_url" {
  type        = string
  description = "The full registry path to the Docker image including the image name."
  default     = "ghcr.io/liquality/ethereum-indexer-api"
}

# ------------------------------------------------------------------------------
# Container settings
# ------------------------------------------------------------------------------
variable "api_task_name" {
  type        = string
  description = "The name to attach to the running container."
  default     = "indexer-api"
}

variable "api_image_version" {
  type        = string
  description = "The Docker image version to use."
  default     = "latest"
}

variable "api_container_memory_alloc" {
  type        = number
  description = "The memory allocation to designate for the container."
  default     = 512
}

variable "api_container_cpu_alloc" {
  type        = number
  description = "The CPU allocation to designate for the container."
  default     = 256
}

variable "api_is_essential" {
  type        = bool
  description = "Wheteher or not to denote the container as essential."
  default     = true
}

variable "api_container_port" {
  type        = number
  description = "The port for the API."
  default     = 8080
}

variable "api_environment_vars" {
  type        = list(map(string))
  description = "A list of environment variables to pass to the running container."
  default     = []
}
