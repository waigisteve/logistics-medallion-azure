# Azure Cost Model

## Primary Cost Drivers

- `Event Hubs`: throughput units or processing units
- `ADLS Gen2`: retention, transaction volume, and lifecycle policy
- `Stream Analytics` or `Databricks`: continuous processing runtime
- `Snowflake`: warehouse concurrency and full-scan risk
- `Azure Monitor` and `Log Analytics`: ingestion and retention

## Main Levers

- Size Event Hubs from measured traffic instead of peak guesswork.
- Expire bronze aggressively after replay requirements are met.
- Compact curated files to reduce repeated downstream scans.
- Keep Snowflake loads incremental and isolate heavy consumers.

## Risk Areas

- Over-provisioned Event Hubs during normal traffic
- Always-on compute when batch-like windows would suffice
- Small-file buildup in curated layers
