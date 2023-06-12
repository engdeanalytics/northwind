WITH
    fonte_funcionarios AS (
        SELECT
            *
        FROM
            {{ source('erp', 'employees') }}
    ),
    
    renomear AS (
        SELECT
            cast(employee_id AS int) AS id_funcionario
            , cast(last_name AS string) AS func_sobrenome
            , cast(first_name AS string) AS func_nome					
            , cast(birth_date AS date) AS func_dt_nascimento	
            , cast(hire_date AS date) AS func_dt_contratacao
            , cast(address AS string) AS func_endereco
            , cast(city AS string) AS func_cidade
            , cast(region AS string) AS func_regiao
            , cast(postal_code AS string) AS func_cep
            , cast(country AS string) AS func_pais
            , cast(notes AS string) AS func_notas
            , cast(reports_to AS int) AS id_gerente
        FROM
            fonte_funcionarios
    )
SELECT * FROM renomear