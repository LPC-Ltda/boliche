json.extract! pedido, :id, :hora_pedido, :hora_entrega, :observacion, :registro_id, :estado, :creado_por, :actualizado_por, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
