Bem-vindo ao projeto demo da Northwind!

### O que é este projeto?

Este é um projeto exemplo de conceitos do dbt usando os dados da Northwind.

### Pré-requisitos

Antes de começar, você precisa ter instalado:

- Python 3.7 ou superior
- [dbt Core](https://docs.getdbt.com/docs/installation) ou [dbt cloud](https://cloud.getdbt.com/)
- Acesso a um Data Warehouse [compatível com dbt](https://docs.getdbt.com/docs/trusted-adapters) (este tutorial usa [Databricks](https://www.databricks.com/learn/free-edition) como exemplo)

### Instruções

1. Faça um fork deste repositório

Clique no botão "Fork" no GitHub para criar uma cópia na sua conta.

2. Clone o repositório

```
git clone https://github.com/SEU-USUARIO/northwind.git
```
   
3. Acesse o repositório:

```
cd northwind
```

4. Configure seu profile do dbt

Você deverá configurar um *profile* para o seu DW adicionando o seguinte trecho de código no arquivo `~/.dbt/profiles.yml` (lembre-se de alterar as variáveis específicas para seu projeto):

```yaml
northwind:
  target: dev
  outputs:
    dev:
      type: databricks
      catalog: workspace
      schema: default
      host: YOURORG.databrickshost.com  # Substitua pelo seu host
      http_path: /SQL/YOUR/HTTP/PATH  # Substitua pelo seu path HTTP
      token: dapiXXXXXXXXXXXXXXXXXXXXXXX  # Substitua pelo seu token de acesso
```

5. Em seguida, teste se a configuração está correta:

```bash
dbt debug

(...)
  Connection test: [OK connection ok]

All checks passed!
```

6. Carregue os dados

(opcional) Se você não fez a ingestão dos dados brutos para o data warehouse, pode fazê-lo utilizando o `dbt seed` (esta prática não é recomendada em projetos reais, somente usada aqui para fins educacionais):

```
dbt seed
```

Pronto! Você tem um projeto dbt configurado e com dados disponíveis no Data Warehouse.

### Saiba mais:
- Aprenda mais sobre o dbt [na documentação oficial](https://docs.getdbt.com/docs/introduction)
