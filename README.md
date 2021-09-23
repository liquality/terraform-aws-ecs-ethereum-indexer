# terraform-aws-ecs-ethereum-indexer

Terraform module for Liquality's Ethereum-based chain indexer services (AWS ECS).

## Table of Contents

* [Introduction][section-introduction]
* [Usage][section-usage]
* [Inputs][section-inputs]
* [Requirements][section-requirements]
* [Providers][section-providers]
* [License][section-license]


## Introduction

[TBC]


## Usage

Example of an ETH ropsten configuration:

```
module "indexer-ropsten" {
  source = "github.com/liquality/terraform-aws-ecs-ethereum-indexer.git?ref=tags/v0.0.3"

  # The target environment
  env_alias  = "chainhub"
  aws_region = "us-east-1"

  # Chain settings
  chain_id               = "eth"
  chain_network_name     = "ropsten"
  chain_network_endpoint = "https://ropsten.infura.io/v3/12345ffff12345fffff1234512345ff"

  # Database settings
  mongo_db_name     = "indexerEthRopsten"
  mongo_db_host     = var.mongo_db_host     # loaded from secret
  mongo_db_user     = var.mongo_db_user     # loaded from secret
  mongo_db_password = var.mongo_db_password # loaded from secret

  # API settings
  api_image_version          = "latest"
  api_environment_vars       = []
  api_container_memory_alloc = 512
  api_container_cpu_alloc    = 256
  api_instance_count         = 2

  # Worker settings
  worker_image_version          = "latest"
  worker_environment_vars       = [{ name = "MAX_BLOCK_BATCH_SIZE", value = 10 }, { name = "MAX_TRANSACTION_BATCH_SIZE", value = 15 }]
  worker_container_memory_alloc = 512
  worker_container_cpu_alloc    = 256
}
```


## Inputs

[TBC]


## Requirements

[TBC]


## Providers

| Name    | Version |
| ------- | ------- |
| aws     | >= 3.38 |


## License

[TBC]



[section-introduction]: #introduction
[section-usage]: #usage
[section-inputs]: #inputs
[section-requirements]: #requirements
[section-providers]: #providers
[section-license]: #license
