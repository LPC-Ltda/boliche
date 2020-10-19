class Registro < ApplicationRecord
	ESTADOS = ['activo', 'baja']

	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}
	D_SHOW = {
		titulo:   true,
		nav:      false,
		detalle:  true,
		tabs:     true,
		adjuntos: false,
		tablas:   false
	}

	TABLA_FIELDS = [
		['nombre', 'fnormal'], 
		['email', 'fshow'], 
		['direccion', 'fnormal'], 
		['telefono', 'fnormal']
	]
	SHOW_FIELDS = [
		['nombre',          'fnormal'],
		['email',           'fnormal'],
		['direccion',       'fnormal'],
		['telefono',        'fnormal'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]

	TIPO_NEW = 'join_display'
	LINK_SELECCION = "/zonas/seleccion"
	THROUGH_REF = 'empresas'
	F_TABLA = 'clientes'

	belongs_to :empresa
	belongs_to :cliente

	has_many :pedidos

	def nombre_display
		self.cliente.nombre
	end
end
