# Azure Implementation Plan

## Workflow

1. Publish into `Event Hubs`.
2. Capture raw events into `ADLS Gen2`.
3. Validate and enrich via `Stream Analytics` or `Databricks`.
4. Persist silver and gold medallion layers in ADLS.
5. Load Snowflake staging and marts.

## Why Azure

- Strong fit for organizations already using centralized Azure governance.
- Works well where `Entra ID`, private networking, and Purview-style data controls matter.

## Cost Strategy

- Keep Event Hubs sized to measured throughput.
- Prefer Stream Analytics or job clusters when always-on Databricks is not needed.
- Use lifecycle and compaction to control ADLS and Snowflake scans.
