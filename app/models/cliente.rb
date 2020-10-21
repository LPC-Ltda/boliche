class Cliente < ApplicationRecord
	ESTADOS = ['activo', 'baja']

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

	belongs_to :zona
	belongs_to :usuario, optional: true

	has_many :registros

	has_many :empresas, through: :registros
end
