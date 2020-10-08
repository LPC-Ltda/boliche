json.extract! empleado, :id, :rut, :nombre, :apellido_paterno, :apellido_materno, :rol, :email, :rol_id, :empresa_id, :usuario_id, :estado, :creado_por, :actualizado_por, :created_at, :updated_at
json.url empleado_url(empleado, format: :json)
