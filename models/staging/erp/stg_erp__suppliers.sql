with
    source_suppliers as (
        select *
        from {{ source('erp', 'suppliers') }}
    )

    , renamed as (
        select
            cast(id as int) as supplier_pk
            , cast(companyname as string) as supplier_name
            , cast(city as string) as supplier_city
            , cast(country as string) as supplier_country
        from source_suppliers
    )

select *
from renamed
