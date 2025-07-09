with
    -- imports models
        products as (
            select *
            from {{ ref('stg_erp_products') }}
        )
        , suppliers as (
            select *
            from {{ ref('stg_erp_suppliers') }}
        )
        , categories as (
            select *
            from {{ ref('stg_erp_categories') }}
        )
    -- transformation
    , joined as (
        select
            products.product_fk
            , products.supplier_fk
            , products.category_fk
            , products.product_name
            , products.quantitiy_per_unit
            , products.unit_price
            , products.units_in_stock
            , products.units_on_order
            , products.reoder_level
            , products.discontinued
            , supplers.supplier_name
            , supplers.supplier_city
            , supplers.supplier_country
            , categories.category_name
        from
        left join suppliers on products.suplier_fk = supplers.supplier_pk
        left join categories on products.category_fk = categories.category_pk
    )

select *
from joined