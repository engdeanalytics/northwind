with
    erp_employees as (
        select 
            funcionario_id
            , gerente_id      
            , sobrenome
            , nome
            , nome_completo
            , data_nasc
            , data_contratacao
            , endereco
            , cidade
            , regiao
            , cep
            , pais
            , notas
        from {{ ref('stg_erp__employees') }}
    )

    , erp_managers as (
        select *
        from {{ ref('stg_erp__employees') }}
    )

    , join_employees_to_managers as (
        select
            erp_employees.funcionario_id
           , erp_employees.gerente_id         
           , erp_employees.sobrenome
           , erp_employees.nome
           , erp_employees.nome_completo
           , erp_managers.nome_completo as Nome_gerente
           , erp_employees.data_nasc
           , erp_employees.data_contratacao
           , erp_employees.endereco
           , erp_employees.cidade
           , erp_employees.regiao
           , erp_employees.cep
           , erp_employees.pais
           , erp_employees.notas
        from erp_employees 
        left join erp_managers on erp_employees.gerente_id = erp_managers.funcionario_id
    )

select *
from join_employees_to_managers
