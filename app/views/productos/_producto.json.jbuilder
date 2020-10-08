json.extract! producto, :id, :producto, :disponibilidad, :demora_minutos, :estado, :creado_por, :actualizado_por, :created_at, :updated_at
json.url producto_url(producto, format: :json)
