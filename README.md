Bem-vindo ao projeto demo da Northwind!

### O que é este projeto?

Este projeto é um projeto exemplo de conceitos do dbt usando os dados da Northwind.

### Usando o projeto

1. Para iniciar o projeto você vai precisar ter o dbt instalado no seu computador conforme as instruções neste [link](https://docs.getdbt.com/docs/installation) ou utilizando o [dbt cloud](https://cloud.getdbt.com/).

2. Clone este repositório
   
3. Acesse o repositório:

```
cd academy-2022-11
```

4. Você deverá configurar um *profile* para o seu DW adicionando o seguinte trecho de código no arquivo `~/.dbt/profiles.yml` (lembre-se de alterar as variáveis específicas para seu projeto):

```yaml
northwind:
  outputs:
    dev:
      dataset: northwind
      job_execution_timeout_seconds: 300
      job_retries: 1
      keyfile: path/to/keyfile.json
      location: US
      method: service-account
      priority: interactive
      project: <project_id>
      threads: 1
      type: bigquery
```

5. Em seguida, teste se a configuração está correta:

```bash
dbt debug

(...)
  Connection test: [OK connection ok]

All checks passed!
```

1. (opcional) Se você não fez a ingestão dos dados brutos para o data warehouse, pode fazê-lo utilizando o `dbt seed` (esta prática não é recomendada em projetos reais, somente usada aqui para fins educacionais):

```
dbt seed
```

Pronto! Você tem um projeto dbt configurado e com dados disponíveis no Data Warehouse.

### Saiba mais:
- Aprenda mais sobre o dbt [na documentação oficial](https://docs.getdbt.com/docs/introduction)
