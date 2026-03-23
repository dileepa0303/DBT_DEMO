{{ config(materialized='ephemeral') }}
 
SELECT
    customer_id,
    first_name,
    last_name,
    updated_at
FROM {{ source('raw', 'customers') }}