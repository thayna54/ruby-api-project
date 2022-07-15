
Dado('que o usuário gostaria de realizar ações com um usuário') do
  @base_step = Users.new()
  @service = ServiceBase.new()
  teste = @service.get_data_yml("Usuarios","credenciais_validas")
  puts teste
end

E('o usuário guarda o código do usuário cadastrado') do
  @service = ServiceBase.new()
  result = @service.field_value('id')
  @base_step.add_user_in_the_path(result) 
end