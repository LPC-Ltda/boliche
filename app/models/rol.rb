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

	FORM_FIELDS = [
		['rol',             'entry'],
		['empresa_id',      'hidden'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]

	TABLA_FIELDS = ['rol']

	TIPO_NEW = 'child'
	PADRE = 'empresas'

  	belongs_to :empresa

	has_many :empleados
end
