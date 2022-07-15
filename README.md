# ruby-api-model-project - Testes/Back
Projeto de automação da API

## Inicialização
Para o desenvolvimento dessa aplicação de teste, foram utilizadas as seguintes ferramentas:
1.  [Ruby](https://rubyinstaller.org/)
2.	[Cucumber](https://cucumber.io/)
3.  [HTTParty](https://rubygems.org/gems/httparty/)
4.	[Rspec](https://github.com/rspec/rspec)
5.  [Git](https://git-scm.com/download/win)

### Pré requisitos
Necessário instalar o [Ruby](https://rubyinstaller.org/) na versão mais recente e em seguida rodar os comandos através terminal:

```
gem install bundler --force
```

### Instalação
>Clonar o projeto no diretório de interesse e abrir o terminal dentro da pasta do projeto:
```
git clone <url-clone-projeto>
```
>Executar o comando abaixo para realizar a instalação das dependências:
```
bundle install
```
# Execução dos Testes
>Após a instalação das dependências e configuração do ambiente, seguir os passos:
```
rake api_test[environment,tags]
```
###### Testes de contratos
>Utilizar o criador de schemas:
    https://app.quicktype.io/

>Para ver o exemplo funcionando, executar o seguinte comando:
```
rake api_test[uat,@contractExample]
```

###### Parâmetros
1.  **environment:** prod ou uat ou des
2.  **tags:** @smoke_test, @regression_test

# ALLURE

# Instalação do Allure for windows


### Comando de instalação
scoop install allure

### Execução do Allure
allure serve allure-results

### Gems utilizadas - 

* gem 'allure-cucumber'
* gem 'cucumber'
* gem 'factory_bot'
* gem 'faker'
* gem 'httparty'
* gem 'rspec'
* gem 'rubocop'
* gem 'rake'
* gem 'json-schema-rspec'

## Estrutura do projeto 

#### Pasta features
 > * services - Pasta que contém os serviços para utilização nos testes
 > > * xxxxx.rb - Arquivos que contém classes para inicialização de cada Endpoint e demais serviços gerais
 > * steps - Pasta que contém os arquivos com a implementação dos métodos para execução dos cenários
 > > * xxxxx_steps.rb - Arquivos que contém a implementação dos métodos mencionados acima
 > * specs - Pasta que contém os cenários de teste em BDD
 > > * xxxxx.feature - Arquivos que contém as especificações das funcionalidades e estórias de usuário em BDD
 > * support - Pasta que contém arquivos de configurações do framework
 
 #### Arquivo service_base.rb
 
* ```def initialize()``` - Define método para zerar as variáveis do request.
* ```def start_header()```- Define método dos parâmetros do header do request.
* ```def clear_all()``` - Define método para checagem e limpeza dos objetos informados.
* ```add_field(field, value)``` - Define o campo e o valor informado pelo usuario
* ```get_fields()``` - Obtem os campos do request
* ```def add_header```- Define método para inserção do parâmetro no objeto header.
* ```def add_query_parameter``` - Define método para inserção de parâmetros da query do request.
* ```def get()``` - Define método de output do request e do response no console.
* ```post(bodyAux)``` - Prepara e envia o request de inserção, armazenando o response
* ```def logRequest()``` - Define método para montagem do request.
* ```printLog(title, message)``` - Envia o output do console para o report
* ```def logResponse()``` - Define método para montagem do response.
* ```def check_int(obj)``` - Define método para conversão de dados a partir do parâmetro "obj". Se "obj" for numérico, converte para inteiro, caso contrário, converte para string.
* ```def field_value(campo)``` - Define método para remoção dos "." do parâmetro e percorre o array dentro do Json de acordo com os níveis para obter a chave requerida.