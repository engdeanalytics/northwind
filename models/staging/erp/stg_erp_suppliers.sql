with 
    source as (
        select *
        from {{ source('erp', 'suppliers')}}
    )
    , renamed as (
        select
           cast(ID as varchar) as supplier_pk
           , cast(COMPANYNAME as varchar) as supplier_name
           --, cast(CONTACTNAME as varchar) as supplier_
           --, cast(ADDRESS as varchar) as supplier_
           , cast(CITY as varchar) as supplier_city
           , cast(REGION as varchar) as supplier_region
           --, cast(POSTALCODE as varchar) as supplier_
           , cast(COUNTRY as varchar) as supplier_country
           --, cast(PHONE as varchar) as supplier_
           --, cast(FAX as varchar) as supplier_
           --, cast(HOMEPAGE as varchar) as supplier_
        from source
    )

    select *
    from renamed