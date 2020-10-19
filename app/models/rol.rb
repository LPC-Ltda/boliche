class Rol < ApplicationRecord
	TABS = []
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

	FORM_FIELDS = [
		['rol',             'entry'],
		['empresa_id',      'hidden'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]

	SHOW_FIELDS = [
		['rol',             'normal'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]

	TABLA_FIELDS = [['rol', 'show']]

	TIPO_NEW = 'child'
	PADRE = 'empresas'

  	belongs_to :empresa

	has_many :empleados

	def nombre_display
		self.rol
	end
end
