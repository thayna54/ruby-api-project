#language: pt

@testExample
Funcionalidade: template de testes

	Como usuário da API de users
	Quero fazer uma busca utilizando Users
	Para validar o response

	@post_example @get_example
	Cenário: Executando um POST e um GET
		Dado que o usuário gostaria de realizar ações com um usuário
		E o usuário informa o campo "login" com o valor "nometeste"
		E o usuário informa o campo "full_name" com o valor "Nome Teste"
		E o usuário informa o campo "email" com o valor "nometeste@gmail.com"
		E o usuário informa o campo "age" com o valor "28"
		Quando o usuário salvar a informação
		E o usuário guarda o código do usuário cadastrado
		Então o usuário deveria ver a mensagem "salvo com sucesso"

		Quando o usuário buscar a informação
		Então o usuário deveria ver a mensagem "sucesso"
		E o usuário deveria ver o campo "login" com valor "nometeste"
		E o usuário deveria ver o campo "full_name" com valor "Nome Teste"
		E o usuário deveria ver o campo "email" com valor "nometeste@gmail.com"
		E o usuário deveria ver o campo "age" com valor 28