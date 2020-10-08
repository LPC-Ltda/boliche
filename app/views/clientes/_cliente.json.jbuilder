json.extract! cliente, :id, :nombre, :email, :direccion, :telefono, :zona_id, :usuario_id, :estado, :creado_por, :actualizado_por, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
