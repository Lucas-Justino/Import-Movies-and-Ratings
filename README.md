# Instruções de Instalação e Uso

Após clonar o repositório do projeto, navegue até a pasta criada usando o comando `cd`.

## Corrigindo a Versão do Ruby

Ao executar `bundle install`, você pode encontrar o seguinte erro:

```
Your Ruby version is 3.2.3, but your Gemfile specified 3.1.4
```

Para corrigir isso, abra o arquivo `Gemfile` localizado em `Import-Movies-and-Ratings/Gemfile` e modifique a versão do Ruby para `3.2.3`.

## Instalando Dependências e Configurando o Banco de Dados

Após a correção da versão do Ruby, você pode instalar as dependências do projeto e configurar o banco de dados executando os seguintes comandos:

```
bundle install
rails db:migrate
rails db:seed
```

## Iniciando o Servidor

Após realizar essas etapas, você pode iniciar o servidor executando o comando:

```
rails server
```

Ao iniciar o servidor, abra o localhost especificado, que provavelmente será na porta 3000, em seu navegador.

## Realizando o Login

Ao acessar o servidor, você pode encontrar um erro na primeira tentativa, mas basta recarregar a página para ser redirecionado à página de login.

Utilize as seguintes credenciais de login:

- **Usuário**: admin@rotten
- **Senha**: admin

## Utilizando as Funcionalidades

Após o login bem-sucedido, você será direcionado para uma página com três links:

- **Adicionar Filme**: Permite adicionar um novo filme ao sistema.
- **Importar Filmes**: Permite importar filmes a partir de um arquivo CSV. O arquivo `movies.csv` na pasta do projeto pode ser utilizado para essa importação.
- **Importar Notas**: Permite importar notas para os filmes a partir de um arquivo CSV. O arquivo `ratings.csv` na pasta do projeto pode ser utilizado para essa importação. Certifique-se de manter a mesma estrutura do arquivo para garantir a importação correta.
