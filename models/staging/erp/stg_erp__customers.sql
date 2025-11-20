with
    source_customers as (
        select *
        from {{ source('erp', 'customers') }}
    )

    , renamed as (
        select
            cast(id as string) as customer_pk
            , cast(companyname as string) as customer_company_name
            , cast(city as string) as customer_city
            , cast(region as string) as customer_region
            , cast(country as string) as customer_country
        from source_customers
    )

select *
from renamed
