Bem-vindo ao projeto demo da Northwind!

### O que é este projeto?

Este é um projeto exemplo de conceitos do dbt usando os dados da Northwind.

### Pré-requisitos

Antes de começar, você precisa ter instalado:

- Python 3.7 ou superior
- [dbt Core](https://docs.getdbt.com/docs/installation) ou [dbt cloud](https://cloud.getdbt.com/)
- Acesso a um Data Warehouse compatível com dbt (Databricks, Snowflake, BigQuery, etc.)

### Instruções

1. Clone este repositório.

```
git clone https://github.com/engdeanalytics/northwind.git
```
   
2. Acesse o repositório:

```
cd northwind
```

3. Você deverá configurar um *profile* para o seu DW adicionando o seguinte trecho de código no arquivo `~/.dbt/profiles.yml` (lembre-se de alterar as variáveis específicas para seu projeto):

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

4. Em seguida, teste se a configuração está correta:

```bash
dbt debug

(...)
  Connection test: [OK connection ok]

All checks passed!
```

5. (opcional) Se você não fez a ingestão dos dados brutos para o data warehouse, pode fazê-lo utilizando o `dbt seed` (esta prática não é recomendada em projetos reais, somente usada aqui para fins educacionais):

```
dbt seed
```

Pronto! Você tem um projeto dbt configurado e com dados disponíveis no Data Warehouse.

### Saiba mais:
- Aprenda mais sobre o dbt [na documentação oficial](https://docs.getdbt.com/docs/introduction)
