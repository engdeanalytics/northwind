# Northwind — Engenharia de Analytics

Este repositório é o ponto de partida utilizado no livro **Engenharia de Analytics** para praticar:

- A preparação do ambiente descrita no **Capítulo 12** (Databricks + GitHub + dbt Cloud).
- A modelagem dimensional guiada no **Capítulo 15**, com dbt executando os modelos Northwind.

O código aqui presente contém as *seeds* com os dados da Northwind. A branch de [recursos](https://github.com/engdeanalytics/northwind/tree/recursos) a estrutura de *staging*, *intermediate* e *marts* e os exemplos de testes/documentação mostrados no livro. Use‑o como referência ou como base para seu fork ao longo dos capítulos.

---

## Capítulo 12 – Configurando o ambiente

### 12.1 Databricks (Seção {ref}`config_ambiente`)
1. Crie uma conta Free Edition no [Databricks](https://www.databricks.com/learn/free-edition) e use o **Serverless Starter Warehouse**.
2. No menu **Catalog**, crie os catálogos `raw`, `dev` e `prod` para isolar os ambientes conforme indicado no livro.
3. Gere dois *Access Tokens* em **User Settings → Developer**: `dbt-developer` (para desenvolvimento) e `dbt-production` (para o target prod).
4. Anote o **Server Hostname** e o **HTTP Path** disponíveis na aba **Connection details** do warehouse; eles serão usados pelo dbt.

### 12.2 GitHub (Seção {ref}`github`)
1. Faça login no GitHub e crie um fork de [github.com/engdeanalytics/northwind](https://github.com/engdeanalytics/northwind).
2. Guarde a URL do seu fork (`https://github.com/<usuario>/<repo>`); ela será conectada ao dbt Cloud.
3. Opcional: clone o seu fork (`git clone ...`) para acompanhar o código localmente e adicione o `upstream` apontando para o repositório oficial.

### 12.3 dbt Cloud (Seção {ref}`dbt_platform`)
1. No [dbt Cloud](https://cloud.getdbt.com), crie um novo projeto e escolha **Databricks** como plataforma.
2. Informe **Host**, **HTTP Path**, **Token** (`dbt-developer`) e o catálogo `dev`. Use um schema exclusivo, como `dbt_<seu_usuario>`.
3. Conecte o fork criado na etapa anterior e finalize o assistente.
4. No **dbt Cloud IDE**, rode `dbt deps`, `dbt seed` (caso ainda não tenha carregado os dados) e `dbt run`/`dbt test` para validar o ambiente conforme o capítulo.

---

## Usando dbt Core + VS Code com Databricks

Se preferir replicar as etapas do capítulo 15 localmente (dbt Core + VS Code), siga o fluxo orientado no livro:

1. **Preparação**
   - Tenha Python 3.8+ instalado e crie um ambiente virtual: `python -m venv .venv && source .venv/bin/activate`.
   - Instale o adaptador Databricks: `pip install dbt-databricks`.
   - Clone o fork deste repositório e abra a pasta `/northwind` no VS Code.
2. **Profile do dbt**
   - No arquivo `~/.dbt/profiles.yml`, configure o profile `northwind` com os valores coletados na Seção 12.1:
    ```yaml
    northwind:
	  target: dev
      outputs:
        dev:
		  type: databricks
		  catalog: dev
		  schema: dbt_<seu_usuario>
		  host: adb-XXXXXXXXXXXX.azuredatabricks.net
		  http_path: /sql/1.0/warehouses/<WAREHOUSE_ID>
		  token: dapiXXXXXXXXXXXXXXXX
		  threads: 4
    ```
   - Quando for promover para produção, adicione o target `prod` reutilizando o token `dbt-production` e o catálogo `prod`.
3. **VS Code**
   - Selecione o interpretador Python do `.venv` e use o terminal integrado para executar os comandos `dbt`.
   - Extensões úteis: *Python*, *SQLTools* e *dbt Power User* para navegação rápida entre modelos.
4. **Execução**
   - Valide a conexão com `dbt debug`.
   - Carregue as seeds (`dbt seed`) exatamente como demonstrado no capítulo.

Ao seguir estas instruções você reproduz o laboratório completo descrito no livro, usando o Databricks como data warehouse e o projeto Northwind como base de código única para o Capítulo 12 e para os exercícios de modelagem do Capítulo 15.
