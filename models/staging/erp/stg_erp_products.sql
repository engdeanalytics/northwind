with
    source_products as (
        select *
        from {{ source('erp', 'products')}}
    )

    , renamed as (
        select
            cast(id as int) as product_fk
            , cast(supplierid as int) as supplier_fk
            , cast(categoryid as int) as category_fk
            , cast(productname as string) as product_name
            , cast(quantityperunit as string) as quantitiy_per_unit
            , cast(unitprice as numeric(18,2)) as unit_price
            , cast(unitsinstock as int) as units_in_stock
            , cast(unitsonorder as int) as units_on_order
            , cast(reorderlevel as int) as reoder_level
            , discontinued as discontinued
        from source_products
    )

select *
from renamed