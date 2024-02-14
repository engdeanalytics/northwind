/* O time comercial tem validado que as vendas realizadas em 1997 somam $ 658,388.75 */
with
    vendas_em_1997 as (
        select sum(total_bruto) as total_bruto_vendido
        from {{ ref('fct_vendas') }}
        where data_do_pedido between '1997-01-01' and '1997-12-31'
    )
select total_bruto_vendido
from vendas_em_1997
where total_bruto_vendido not between 658388 and 658389