WITH
    erp_employees AS (
        SELECT 
            funcionario_id
            ,gerente_id
            ,sobrenome
            ,nome
            ,nome_completo
            ,data_nascimento
            ,data_contratacao
            ,endereco
            ,cidade
            ,regiao
            ,cep
            ,pais
        FROM {{ ref('stg_erp__employees') }}
    )
    
    , erp_managers AS (
        SELECT *
        FROM {{ ref('stg_erp__employees') }}
    )

    ,join_employee_to_manager AS (
        SELECT
             erp_employees.funcionario_id
            ,erp_employees.gerente_id
            ,erp_employees.sobrenome
            ,erp_employees.nome
            ,erp_employees.nome_completo
            ,erp_managers.nome_completo AS gerente_nome_completo
            ,erp_employees.data_nascimento
            ,erp_employees.data_contratacao
            ,erp_employees.endereco
            ,erp_employees.cidade
            ,erp_employees.regiao
            ,erp_employees.cep
            ,erp_employees.pais
        FROM erp_employees
        LEFT JOIN erp_managers
            ON erp_employees.gerente_id = erp_managers.funcionario_id
    )

SELECT *
FROM erp_employees