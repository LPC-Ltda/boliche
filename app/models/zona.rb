class Zona < ApplicationRecord
	has_many :clientes

	TABS = []
	ESTADOS = ['activa', 'baja']

	D_TABLA = {
		ftabs:   true,
		titulo:  true,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}
end
