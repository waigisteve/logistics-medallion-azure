# Azure Route

This route implements the scenario with:

- `Azure Event Hubs`
- `ADLS Gen2`
- `Azure Stream Analytics` or `Azure Databricks`
- `Snowflake`

## Repository Navigation

- `docs/implementation_plan.md`
- `docs/tooling_and_workflow.md`
- `docs/deployment_sequence.md`
- `docs/cost_model.md`
- `docs/architecture_workflow.md`
- `docs/integrity_security_controls.md`
- `terraform/README.md`

## Route Intent

This route is for teams that want the medallion pattern governed through Azure-native identity, storage, and data-control services before curated data is exposed downstream.

It is designed for:

- `<5 minute` shipment-status freshness
- `<10 second` dashboard reads through curated gold outputs loaded into `Snowflake`
- Strong identity and governance alignment through `Entra ID`, `Key Vault`, and `Purview`
- Predictable storage and streaming cost through measured Event Hubs sizing and ADLS lifecycle rules

## Defined Tools

| Stage | Primary Tool | Role |
|---|---|---|
| Ingestion | `Azure Event Hubs` | Accept streaming logistics events with partitioned retention |
| Bronze/Silver/Gold object storage | `ADLS Gen2` | Store medallion layers with hierarchical namespace controls |
| Schema control | `Event Hubs Schema Registry` | Enforce producer contracts and schema versioning |
| Stream processing | `Azure Stream Analytics` or `Azure Databricks` | Validate, deduplicate, enrich, watermark, and quarantine |
| Governance | `Microsoft Purview` | Metadata, lineage, and policy alignment |
| Serving warehouse | `Snowflake` | Gold marts, BI-facing serving tables, and downstream analytical extracts |
| Observability | `Azure Monitor` and `Log Analytics` | Freshness, lag, and failure alerting |

## Scaffold Contents

- `docs/implementation_plan.md`: route workflow and implementation plan
- `docs/tooling_and_workflow.md`: tool definitions and stage ownership
- `docs/deployment_sequence.md`: rollout sequence for `dev`, `test`, and `prod`
- `docs/cost_model.md`: primary cost levers and risk areas
- `terraform/`: modular scaffold with environment entry points
- `.github/workflows/terraform.yml`: CI validation skeleton

## Terraform Structure

- `terraform/security`: Key Vault and managed identity
- `terraform/streaming`: Event Hubs namespace and hub
- `terraform/data_lake`: ADLS Gen2 account and containers
- `terraform/processing`: Stream processing placeholders
- `terraform/warehouse_integration`: secret placeholders for Snowflake connectivity
- `terraform/observability`: Log Analytics and alerting
