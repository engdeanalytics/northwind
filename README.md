Bem-vindo ao projeto demo da Northwind!

### O que é este projeto?

Este é um projeto exemplo de conceitos abordados no livro [Engenharia de Analytics](https://www.engdeanalytics.com.br/intro.html) usando os dados da Northwind com dbt Cloud e Databricks.

### Pré-requisitos

Antes de começar, certifique-se de que você possui:

- [ ] Uma conta ativa no [Databricks](https://www.databricks.com/learn/free-edition)
- [ ] Um SQL Warehouse configurado no seu workspace Databricks
- [ ] Uma conta no [GitHub](https://github.com/)

### Instruções

#### 1. Faça um fork deste repositório

Clique no botão *Fork* no canto superior direito desta página para criar uma cópia deste repositório em sua conta do GitHub.

#### 2. Crie uma conta no dbt Cloud

Acesse [dbt Cloud](https://www.getdbt.com/signup) e complete o cadastro.

#### 3. Configure um ambiente de desenvolvimento no dbt Cloud

- Escolha um nome para o seu projeto (exemplo: "northwind-demo")
- Selecione o Databricks como adaptador
- Preencha as informações do seu workspace Databricks:

  > **Onde encontrar os dados de conexão:**
  > No Databricks, navegue até *SQL Warehouses* → seu warehouse → *Connection Details*

- **Server Hostname:** O hostname do seu servidor (exemplo: `dbc-xxxxxxxx-xxxx.cloud.databricks.com`).
- **HTTP Path:** O caminho HTTP do seu SQL Warehouse. (exemplo: `/sql/1.0/warehouses/xxxxx`)
- **Optional settings → Catalog:** Preencha com `main` ou o catálogo que deseja utilizar.
- **Token:** Para criar um access token pessoal no Databricks:
  - No workspace do Databricks, clique em seu nome de usuário na barra superior
  - Vá em *Settings* → *Developer* → *Access tokens* → *Manage* → *Generate new token*
  - Copie o token gerado e cole no campo correspondente no dbt Cloud
- Clique em *Test Connection*. Se tudo estiver certo, você verá a mensagem de sucesso.

#### 4.	Conecte o dbt Cloud ao seu repositório GitHub

- No dbt Cloud, vá para *Account Settings* → *Integrations* → *GitHub*
- Autorize a conexão e selecione o repositório forkado

#### 5. Carregue os dados iniciais

No dbt Cloud Studio, execute:

```
dbt seed
```

  > **Nota:** O dbt seed é usado aqui apenas para fins educacionais. Em projetos reais, os dados devem ser ingeridos através de ferramentas apropriadas.

#### 6.	Teste o setup completo

No dbt Cloud Studio, execute:

```
dbt debug
```

Se tudo estiver certo, você verá:

```
Connection test: [OK connection ok]
All checks passed!
```

Pronto!

### Saiba mais
- [Documentação oficial do dbt](https://docs.getdbt.com/docs/introduction)
- [Documentação do Databricks](https://docs.databricks.com/)
- [Integração do dbt Cloud com GitHub](https://docs.getdbt.com/docs/cloud/git/connect-github)
- [Integração do dbt Cloud com Databricks](https://docs.getdbt.com/docs/core/connect-data-platform/databricks-setup)