# terraform-aws-ecs-ethereum-indexer

Terraform module for Liquality's blockchain indexer services (AWS ECS).

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

Example of an RSK testnet configuration:

```
module "indexer-rsk-testnet" {
  source = "github.com/liquality/terraform-aws-ecs-ethereum-indexer.git?ref=tags/v0.0.5"

  # The target environment
  env_alias  = "chainhub"
  aws_region = "us-east-1"

  # Chain settings
  chain_network_name     = "rsk-testnet"
  chain_network_endpoint = "https://public-node.testnet.rsk.co"

  # Database settings
  mongo_db_name     = "indexerRskTestnet"
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
  worker_image_version = "latest"
  worker_environment_vars = [
    { name = "START_BLOCK", value = 1397234 },
    { name = "MAX_BLOCK_BATCH_SIZE", value = 10 },
    { name = "MAX_TRANSACTION_BATCH_SIZE", value = 15 },
    { name = "REORG_GAP", value = 3 },
    { name = "BLOCKTIME", value = 1000 }
  ]
  worker_container_memory_alloc = 1024
  worker_container_cpu_alloc    = 512
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
