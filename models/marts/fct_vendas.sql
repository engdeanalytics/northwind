with
    funcionarios as (
        select *
        from {{ ref('dim_funcionarios') }}
    )
    , produtos as (
        select *
        from {{ ref('dim_produtos') }}
    )
    , int_vendas as (
        select *
        from {{ ref('int_vendas__pedido_itens') }}
    )
    , joined_tabelas as (
        select 
            --CHAVES--
            sk_pedido_item
            , int_vendas.id_pedido
            , int_vendas.id_funcionario
            , int_vendas.id_cliente
            , int_vendas.id_transportadora
            , int_vendas.id_produto
            
            --DATAS--
            , int_vendas.data_do_pedido
            , int_vendas.data_do_envio
            , int_vendas.data_requerida_entrega

            --MÉTRICAS--
            , int_vendas.preco_unitario
            , int_vendas.quantidade
            , int_vendas.desconto
            , int_vendas.frete

            --CATEGORIAS (para agrupar as métricas)--
            , int_vendas.destinatario
            , int_vendas.endereco_destinatario
            , int_vendas.cep_destinatario
            , int_vendas.cidade_destinatario
            , int_vendas.regiao_destinatario
            , int_vendas.pais_destinatario
            
            , produtos.nome_produto
            , produtos.eh_descontinuado
            , produtos.nome_categoria
            , produtos.nome_fornecedor
            , produtos.pais_fornecedor

            , funcionarios.nome_funcionario
            , funcionarios.nome_gerente
            , funcionarios.cargo_funcionario
            , funcionarios.dt_nascimento_funcionario
            , funcionarios.dt_contratacao
        from int_vendas
        left join produtos on
            int_vendas.id_produto = produtos.id_produto
        left join funcionarios on
            int_vendas.id_funcionario = funcionarios.id_funcionario
    )
    , transformacoes as (
        select 
        *
        , quantidade * preco_unitario as total_bruto
        , quantidade * preco_unitario * (1 - desconto) as total_liquido
        , case
            when desconto > 0 then 'Sim'
            else 'Nao'
        end as teve_desconto
        , frete / count(id_pedido) over (partition by id_pedido) as frete_ponderado
        from joined_tabelas
    )
    , select_final as (
        select
            --Chaves
            sk_pedido_item
            , id_pedido
            , id_funcionario
            , id_cliente
            , id_transportadora
            , id_produto

            --Datas
            , data_do_pedido
            , data_do_envio
            , data_requerida_entrega

            --Métricas
            , preco_unitario
            , quantidade
            , desconto
            , total_bruto
            , total_liquido
            , teve_desconto
            , frete_ponderado            

            --Categorias (para agrupar as métricas)
            , destinatario
            , endereco_destinatario
            , cep_destinatario
            , cidade_destinatario
            , regiao_destinatario
            , pais_destinatario
            , nome_produto
            , eh_descontinuado
            , nome_categoria
            , nome_fornecedor
            , pais_fornecedor
            , nome_funcionario
            , nome_gerente
            , cargo_funcionario
            , dt_nascimento_funcionario
            , dt_contratacao

        from transformacoes
    )
select *
from select_final