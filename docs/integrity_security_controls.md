# Azure Integrity And Security Controls

## Data Deletion

- `Event Hubs` retention preserves replay.
- `ADLS Gen2` soft delete and versioning protect bronze and curated layers from accidental or malicious removal.
- Gold marts can be rebuilt from the curated lake instead of relying on direct recovery in the serving layer.

## Data Duplication

- Use deterministic event keys and event-time handling in `Stream Analytics` or `Databricks`.
- Keep raw duplicates in bronze for investigation.
- Use idempotent warehouse loads and `MERGE` logic for facts and marts.

## Security Infiltration

- Separate managed identities for ingestion, processing, orchestration, and administration.
- Use `Key Vault`, RBAC, private networking, and monitor access anomalies.
- Tie security alerts to freshness, duplicate-rate, and deletion anomalies.

## Integrity Outcome

The route preserves data integrity by combining replayable ingress, reversible storage deletion controls, and curated-layer idempotence.
