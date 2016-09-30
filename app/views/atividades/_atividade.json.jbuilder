json.extract! atividade, :id, :evento_id, :tituloatividade, :assunto, :resumo, :tipo, :dataHora_inicio, :dataHora_fim, :local, :created_at, :updated_at
json.url atividade_url(atividade, format: :json)