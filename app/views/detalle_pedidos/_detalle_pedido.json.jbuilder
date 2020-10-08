json.extract! detalle_pedido, :id, :cantidad, :observacion, :pedido_id, :producto_id, :estado, :creado_por, :actualizado_por, :created_at, :updated_at
json.url detalle_pedido_url(detalle_pedido, format: :json)
