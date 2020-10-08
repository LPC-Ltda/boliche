json.extract! registro, :id, :cliente_id, :empresa_id, :estado, :creado_por, :actualizado_por, :created_at, :updated_at
json.url registro_url(registro, format: :json)
