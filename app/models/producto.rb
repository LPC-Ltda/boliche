class Producto < ApplicationRecord
	ESTADOS = ['activo', 'baja']

	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}

 	TABLA_FIELDS = [
 		['producto', 'show'], 
 		['disponibilidad', 'normal'], 
 		['demora_minutos', 'normal']
 	]

	TIPO_NEW = 'child_sel'
	SELECTOR = "categorias"

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

	D_SHOW = {
		titulo:   true,
		nav:      false,
		detalle:  true,
		tabs:     false,
		adjuntos: false,
		tablas:   false
	}

	SHOW_FIELDS = [
		['disponibilidad',   'normal'],
		['demora_minutos',   'normal'],
		['estado',           'hidden'],
		['creado_por',       'hidden'],
		['actualizado_por',  'hidden']
	]


	belongs_to :empresa
	belongs_to :categoria

	has_many :detalle_pedidos

	has_many :pedidos, through: :detalle_pedidos

	def show_title
		self.producto
	end
end
