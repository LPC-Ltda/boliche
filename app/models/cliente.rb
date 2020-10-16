class Cliente < ApplicationRecord
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
		['nombre',              'entry'],
		['email',               'entry'],
		['direccion',           'entry'],
		['telefono',            'entry'],
		['zona_id',             'hidden'],
		['estado',              'hidden'],
		['creado_por',          'hidden'],
		['actualizado_por',     'hidden']
	]

	TABLA_FIELDS = [
		['nombre', 'normal'], 
		['email', 'show'], 
		['direccion', 'normal'], 
		['telefono', 'normal']
	]

	TIPO_NEW = 'through_sel'
	LINK_SELECCION = "/zonas/seleccion"
	THROUGH_REF = 'empresas'

	belongs_to :zona
	belongs_to :usuario, optional: true

	has_many :registros

	has_many :empresas, through: :registros
end
