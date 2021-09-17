# terraform-aws-ecs-ethereum-indexer

Terraform module for Liquality's Ethereum-based chain indexer services (AWS ECS).

## Table of Contents

* [Introduction][section-introduction]
* [Usage][section-usage]
* [Inputs][section-inputs]
* [Requirements][section-requirements]
* [Providers][section-providers]


## Introduction

[TBC]


## Usage

```
module "indexer-ropsten" {
  source  = "app.terraform.io/liquality/ecs-ethereum-indexer/aws"
  version = "0.0.1"

  # The target environment
  env_alias  = "chainhub"
  aws_region = "us-east-1"

  # Chain settings
  chain_id               = "eth"
  chain_network_name     = "ropsten"
  chain_network_endpoint = "https://ropsten.infura.io/v3/1a2345fff1234512345abcde12345ff"

  # Database settings
  mongo_uri = "mongodb://myhost:27017/indexerRopsten"

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



[section-introduction]: #introduction
[section-usage]: #usage
[section-inputs]: #inputs
[section-requirements]: #requirements
[section-providers]: #providers
