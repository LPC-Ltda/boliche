class Pedido < ApplicationRecord
	ESTADOS = ['activo', 'baja']
	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}

 	TABLA_FIELDS = [
 		['id',          'show'], 
 		['hora_pedido', 'normal'], 
 		['estado',      'normal']
 	]
	TIPO_NEW = 'child'
	PADRE = 'registros'

	belongs_to :registro

	has_many :detalle_pedidos
end
