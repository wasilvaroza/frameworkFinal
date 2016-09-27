json.extract! participante, :id, :nome, :rg, :dataNasc, :email, :formacao, :created_at, :updated_at
json.url participante_url(participante, format: :json)