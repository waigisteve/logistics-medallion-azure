# Azure Architecture Workflow

<table>
  <tr>
    <td align="center"><img src="assets/icons/azure-event-hubs.svg" width="56" alt="Azure Event Hubs"><br><strong>Event Hubs</strong><br>Ingestion bus</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/azure-storage-account.svg" width="56" alt="Azure Storage"><br><strong>ADLS Gen2</strong><br>Bronze raw landing</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/azure-stream-analytics.svg" width="56" alt="Azure Stream Analytics"><br><strong>Stream Analytics</strong><br>Near-real-time transform path</td>
    <td align="center">or</td>
    <td align="center"><img src="assets/icons/azure-databricks.svg" width="56" alt="Azure Databricks"><br><strong>Azure Databricks</strong><br>Advanced streaming path</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/azure-data-lake-storage.svg" width="56" alt="Azure Data Lake"><br><strong>ADLS Silver/Gold</strong><br>Curated medallion lake</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/snowflake.svg" width="56" alt="Snowflake"><br><strong>Snowflake</strong><br>Serving marts and reconciliation</td>
  </tr>
</table>

## Control Overlay

<table>
  <tr>
    <td align="center"><img src="assets/icons/azure-log-analytics.svg" width="44" alt="Log Analytics"><br><strong>Log Analytics</strong><br>Security and operational telemetry</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/azure-storage-account.svg" width="44" alt="Azure Storage"><br><strong>ADLS Versioning/Soft Delete</strong><br>Delete recovery and tamper resistance</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/azure-event-hubs.svg" width="44" alt="Event Hubs"><br><strong>Event Hubs Retention</strong><br>Replay window for recovery</td>
  </tr>
</table>
