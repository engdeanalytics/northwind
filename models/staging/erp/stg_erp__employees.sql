with
    source_employees as (
        select *
        from {{ source('erp', 'employees') }}
    )

    , renamed as (
        select
            cast(id as int) as employee_pk
            , cast(reportsto as int) as manager_fk
            , firstname || ' ' || lastname as employee_name
            , cast(title as string) as employee_title
            , cast(birthdate as date) as employee_birth_date
            , cast(hiredate as date) as employee_hire_date
            , cast(city as string) as employee_city
            , cast(region as string) as employee_region
            , cast(country as string) as employee_country
            -- , cast(titleofcourtesy as string)
            -- , cast(address as string) 
            -- , cast(postalcode as string) 
            -- , cast(homephone as string)
            -- , cast(extension as string)
            -- , cast(photo as string)
            -- , cast(notes as string)
            -- , cast(photopath as string)
        from source_employees
    )

select *
from renamed
