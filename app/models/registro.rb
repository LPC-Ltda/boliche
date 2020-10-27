class Registro < ApplicationRecord
	ESTADOS = ['activo', 'baja']

	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}

	TABLA_FIELDS = [
		['nombre', 'fnormal'], 
		['email', 'fshow'], 
		['direccion', 'fnormal'], 
		['telefono', 'fnormal']
	]

	TIPO_NEW = 'child_sel'
	SELECTOR = "zonas"

	F_TABLA = 'clientes'

	D_SHOW = {
		titulo:   true,
		nav:      false,
		detalle:  true,
		tabs:     true,
		adjuntos: false,
		tablas:   false
	}

	SHOW_FIELDS = [
		['email',           'fnormal'],
		['direccion',       'fnormal'],
		['telefono',        'fnormal'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]

	belongs_to :empresa
	belongs_to :cliente

	has_many :pedidos

	def show_title
		self.cliente.nombre
	end
end
