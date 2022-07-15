include Validation

Dado('o usuário informa o parametro {string} {string}') do |chave, valor|
  @base_step.add_query_parameter(chave,valor)
end 

Então('o usuário deveria ver a mensagem {string}') do |message|
    status = Hash.new
    status['sucesso'] = 200
    status['salvo com sucesso'] = 201
    status['sem conteúdo'] = 204  
    status['não encontrado'] = 404
    status['não autorizado'] = 401
    status['não permitido'] = 403
    status['erro na requisição'] = 400

    expect(@response.code).to eql status[message]
end

Então('o usuário deveria ver o campo {string} com valor {string}') do |field, value|
  @service = ServiceBase.new()
  result = @service.field_value(field)
  expect(result).to eql value
end

Então('o usuário deveria ver o campo {string} contém o valor {string}') do |field, value|
  @service = ServiceBase.new()
  result = @service.field_value(field)
  expect(result).to include value
end

Então('o usuário deveria ver o campo {string} com valor {int}') do |campo, valor|
  @service = ServiceBase.new()
  result = @service.field_value(campo)
  expect(result).to match(valor)
end

Então('o usuário deveria ver o campo {string} com a regex {string}') do |field, value|
  @service = ServiceBase.new()
  result = @service.field_value(field)
  expect(result).to match(value)
end

Então('o usuário deveria ver o campo {string} com valor nulo') do |field|
  @service = ServiceBase.new()
  result = @service.field_value(field)
  expect(result).to eql nil
end

Então('o usuário deveria ver o campo {string} como um número') do |field|
  @service = ServiceBase.new()
  result = @service.field_value(field)
  res = valid_float?(result) || valid_int?(result)
  expect(res).to eq true
end

Então('o usuário deveria ver o campo {string} como uma url') do |field|
  @service = ServiceBase.new()
  result = @service.field_value(field)
  res = valid_url?(result)
  expect(res).to eq true
end

Então('o usuário deveria ver o campo {string} preenchido') do |field|
  @service = ServiceBase.new()
  result = @service.field_value(field)
  expect(result).not_to be_nil
end

Dado('o usuário informa o header {string} {string}') do |header, valor_header|
    @base_step.add_header(header,valor_header)
    log('header: ' + header)
    log('valor_header: ' + valor_header)
end

Quando('o usuário buscar a informação') do
  @response = @base_step.get()
end

E('o usuário informa o campo {string} com o valor {string}') do |field,value|
  @base_step.add_field(field, value)
end

Quando('o usuário salvar a informação') do
  @response = @base_step.post(@base_step.get_fields())
end