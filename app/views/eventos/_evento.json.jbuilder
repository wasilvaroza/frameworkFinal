json.extract! evento, :id, :titulo, :organizador, :local, :dataHora_inicio, :dataHora_fim, :assunto, :created_at, :updated_at
json.url evento_url(evento, format: :json)