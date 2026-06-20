# Azure Tooling And Workflow

| Stage | Primary Tool | Input | Output | Main Concern |
|---|---|---|---|---|
| Ingestion | `Azure Event Hubs` | Logistics event producers | Partitioned event stream | Throughput units, lag, replay window |
| Raw landing | `ADLS Gen2` | Immutable event payloads | Bronze objects | Retention, lifecycle, partitioning |
| Schema control | `Event Hubs Schema Registry` | Producer contracts | Versioned schemas | Drift detection, compatibility |
| Stream processing | `Azure Stream Analytics` or `Azure Databricks` | Bronze event stream | Silver curated records and quarantine outputs | Stateful deduplication, watermarking |
| Curated storage | `ADLS Gen2` + `Parquet/Delta/Iceberg` | Validated records | Silver and gold datasets | Compaction, partition pruning |
| Serving warehouse | `Snowflake` | Gold lake outputs | BI marts and finance datasets | Warehouse sizing, incremental loads |
| Governance | `Microsoft Purview` | Storage and catalog metadata | Controlled data access and lineage | Metadata completeness |
| Observability | `Azure Monitor` and `Log Analytics` | Platform metrics and logs | Alerts and dashboards | Freshness, failures, cost spikes |

## Default Flow

`Event Hubs -> ADLS bronze -> Stream Analytics/Databricks -> ADLS silver/gold -> Snowflake`

## Notes

- `Snowflake` remains the default serving warehouse in this route.
- `Delta` or `Iceberg` may be chosen based on downstream interoperability requirements.
