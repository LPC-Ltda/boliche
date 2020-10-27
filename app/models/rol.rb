class Rol < ApplicationRecord
	ESTADOS = ['activo', 'baja']

	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}

	TABLA_FIELDS = [
		['rol', 'normal']
	]
	TIPO_NEW = 'new'

	FORM_FIELDS = [
		['rol',             'entry'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]

#	D_SHOW = {
#		titulo:   true,
#		nav:      false,
#		detalle:  true,
#		tabs:     true,
#		adjuntos: false,
#		tablas:   false
#	}

#	SHOW_FIELDS = [
#		['estado',          'hidden'],
#		['creado_por',      'hidden'],
#		['actualizado_por', 'hidden']
#	]


	has_many :empleados

#	def show_title
#		self.rol
#	end
end
