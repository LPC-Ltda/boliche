class Empresa < ApplicationRecord
	has_many :roles
	has_many :empleados
	has_many :registros

	has_many :clientes, through: :registros

	TABS = []

	ESTADOS = ['ingreso', 'activa', 'baja']

	D_TABLA = {
		ftabs:   true,
		titulo:  true,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}
end
