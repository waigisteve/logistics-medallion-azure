# Azure Terraform Scaffold

This scaffold is modular so the route can become an independent project with minimal restructuring.

## Modules

- `security`: Key Vault and managed identity anchors
- `streaming`: Event Hubs resources
- `data_lake`: bronze, silver, and gold ADLS resources
- `processing`: Stream Analytics or Databricks runtime scaffolding
- `warehouse_integration`: Snowflake connectivity placeholders
- `observability`: logs, metrics, and alerts

## Environments

- `envs/dev`
- `envs/test`
- `envs/prod`

Each environment is an entry point that calls the root module with environment-specific values.
