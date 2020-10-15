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

	TABLA_FIELDS = ['nombre', 'email', 'dirección', 'telefono']

	TIPO_NEW = 'through'
	THROUGH_REF = 'empresas'

	belongs_to :zona
	belongs_to :usuario, optional: true

	has_many :registros

	has_many :empresas, through: :registros
end
