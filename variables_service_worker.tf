# ------------------------------------------------------------------------------
# Ethereum Indexer Worker
# ------------------------------------------------------------------------------
variable "worker_service_memory_alloc" {
  type        = number
  description = "The memory allocation for the entire service."
  default     = 512
}

variable "worker_service_cpu_alloc" {
  type        = number
  description = "The CPU allocation for the entire service."
  default     = 256
}

variable "worker_instance_count" {
  type        = number
  description = "The number of instances to run."
  default     = 1 # NOTE: Can only support a single instance for now !!!
}

# ------------------------------------------------------------------------------
# Container settings
# ------------------------------------------------------------------------------
# TODO: Should we name this worker_task_name ???
variable "worker_container_name" {
  type        = string
  description = "The name to attach to the running container."
  default     = "ethereum-indexer-worker"
}

variable "worker_image_version" {
  type        = string
  description = "The Docker image version to use."
  default     = "latest"
}

variable "worker_container_memory_alloc" {
  type        = number
  description = "The memory allocation to designate for the container."
  default     = 256
}

variable "worker_container_cpu_alloc" {
  type        = number
  description = "The CPU allocation to designate for the container."
  default     = 128
}

variable "worker_is_essential" {
  type        = bool
  description = "Wheteher or not to denote the container as essential."
  default     = true
}

variable "worker_environment_vars" {
  type        = list(map(string))
  description = "A list of environment variables to pass to the running container."
  default     = []
}
