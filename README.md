# Aws Terraform Tagging Module

### Description

This module implements the fundamental AWS resources tags

## Usage

Include the next code into your main.tf file. if you need to deploy custom tags besides the common list, please check the example below):

```hcl

module "tagging" {

  source = "modules/.."
    
  # Tagging
  tags = { 
    environment            = "production"
    owner                  = "wepa"
    application            = "beredisa"
    application_repository = "https://beredisa.com"
    iac_repository         = "https://wepa-iac.com"
    custom_tag             = "tag_1"
    custom_tag_2           = "tag_2"
  }
}
```

### Known issues 

- N/A

## Package content
This section explain the structure and elements that represent the artifacts of product.

|Folder|Name|Description
|--|:-|--|
|Root|README.md|Product documentation file|
|Root|main.tf|Terraform file to define resources to be deployed|
|Root|variables.tf|Terraform file to use in pipeline to configure product|
|Root|outputs.tf|Terraform file to use in pipeline to check output|
|Root|versions.tf|Terraform file to define Terraform versions for the artifact|

## Configuration parameters list
## Required parameters for deployment

| Name         | Default Value | Type        | Description                                                                                                           |
|:-------------|:--------------|:------------|:---------------------------------------------------------------------------------------------------------------------|
| tags         | {}            | map(string) | A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level.<br>[Tags block parameters](#Tags-block-parameters) |
| EnableBackup | N/A           | string      | (Required) Enable Backup. Must be either "true" or "false" as strings.                                               |
| KmsCustom    | N/A           | string      | (Required) KMS Custom. Must be either "true" or "false" as strings.                                                  |

## Outputs list

| Name| Output value | Description
|:--|:--|:--|
| tagging | tagging | Tags of the resource created. |

You can see more details about [AWS tag outputs](outputs.tf).
