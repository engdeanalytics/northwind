with
    sshippers as (
        select *
        from {{ ref('stg_erp__shippers') }}
    )

select *

from shippers
