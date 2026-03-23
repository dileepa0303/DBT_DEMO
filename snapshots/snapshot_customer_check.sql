{% snapshot CUSTOMER_SNAPSHOT_CHECK %}
    {{
        config(
            target_schema='snapshots',
            unique_key='customer_id',
            strategy='check',
            check_cols=['first_name']
        )
    }}

    SELECT
        CAST(CUSTOMER_ID AS NUMBER)                    AS customer_id,
        TRIM(FIRST_NAME)                               AS first_name,
        TRIM(LAST_NAME)                                AS last_name,
        TRIM(FIRST_NAME) || ' ' || TRIM(LAST_NAME)     AS customer_name,
        LOWER(TRIM(EMAIL))                             AS email,
        UPPER(TRIM(GENDER))                            AS gender,
        CAST(DATE_OF_BIRTH AS DATE)                    AS date_of_birth,
        INITCAP(TRIM(CITY))                            AS city,
        UPPER(TRIM(STATE))                             AS state,
        UPPER(TRIM(COUNTRY))                           AS country,
        CAST(CREATED_AT AS TIMESTAMP)                  AS created_at,
        CAST(UPDATED_AT AS TIMESTAMP)                  AS updated_at

    FROM {{ source('raw', 'CUSTOMERS') }}

{% endsnapshot %}