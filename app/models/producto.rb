class Producto < ApplicationRecord
	TABS = []
	ESTADOS = ['activo', 'baja']
	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}

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

 	TABLA_FIELDS = [
 		['producto', 'show'], 
 		['disponibilidad', 'normal'], 
 		['demora_minutos', 'normal']
 	]

	TIPO_NEW = 'child_sel'
	LINK_SELECCION = "/categorias/seleccion"
	PADRE = 'empresas'

	belongs_to :empresa
	belongs_to :categoria

	has_many :detalle_pedidos

	has_many :pedidos, through: :detalle_pedidos
end
