class Cliente < ApplicationRecord
	TABS = []
	ESTADOS = ['activo', 'baja']
	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   false
	}

	TABLA_FIELDS = ['nombre', 'email', 'dirección', 'telefono']

	belongs_to :zona
	belongs_to :usuario

	has_many :registros

	has_many :empresas, through: :registros
end
