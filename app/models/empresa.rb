class Empresa < ApplicationRecord
	has_many :roles
	has_many :empleados
	has_many :registros

	has_many :clientes, through: :registros

	D_TABLA = {
		ftabs:   true,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}
end
