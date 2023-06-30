with
    source_employees as (
        select
            cast(employee_id as int) as funcionario_id
            , cast(last_name as string) as sobrenome
            , cast(first_name as string) as nome
            , cast(first_name || ' ' || last_name as string) as nome_completo
            --, title
            --, title_of_courtesy
            , cast(birth_date as date) as data_nascimento
            , cast(hire_date as date) as data_contratacao
            , address as endereco
            , city as cidade
            , region as regiao
            , postal_code as cep
            , country as pais
            --, home_phone
            --, extension
            , notes as notas
            , reports_to as gerente_id
            --, photo_path
        from {{ source('erp', 'employees') }}
    )
select *
from source_employees