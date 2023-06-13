WITH
    funcionarios AS (
        SELECT
            *
        FROM
            {{ ref('stg_erp__funcionarios') }}
    ),

    self_join_gerentes AS (
        SELECT
            funcionarios.id_funcionario
            , funcionarios.id_gerente
            , funcionarios.func_nome
            , gerentes.func_nome AS gerente
            , funcionarios.func_dt_nascimento
            , funcionarios.func_dt_contratacao
            , funcionarios.func_endereco
            , funcionarios.func_cidade
            , funcionarios.func_regiao
            , funcionarios.func_cep
            , funcionarios.func_pais
            , funcionarios.func_notas
        FROM
            funcionarios
        LEFT JOIN
            funcionarios AS gerentes ON funcionarios.id_gerente = gerentes.id_funcionario
    ),

    transformacoes AS (
        SELECT
            row_number() over (order by id_funcionario) AS sk_funcionario
            , *
        FROM
            self_join_gerentes
    )
SELECT * FROM transformacoes