with
    fonte_categories as (
        select *
        from {{ source('erp', 'categories') }}
    )

select * from fonte_categories   