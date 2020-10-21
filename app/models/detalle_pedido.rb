class DetallePedido < ApplicationRecord
	ESTADOS = ['activo', 'baja']

	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}

 	TABLA_FIELDS = [
 		['cantidad', 	'normal'], 
 		['producto_id', 'show'], 
 		['observacion', 'normal']
 	]

	TIPO_NEW = 'detalle_pedido'
	LINK_SELECCION = "/productos/seleccion"
	PADRE = 'empresas'

	FORM_FIELDS = [
		['producto',            'entry'],
		['disponibilidad',      'entry'],
		['demora_minutos',      'entry'],
		['categoria_id',        'hidden'],
		['empresa_id',          'hidden'],
		['rol_id',              'hidden'],
		['estado',              'hidden'],
		['creado_por',          'hidden'],
		['actualizado_por',     'hidden']
	]

	belongs_to :pedido
	belongs_to :producto

	has_many :agregados

	has_many :adicionales, through: :agregados
end
