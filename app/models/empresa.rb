class Empresa < ApplicationRecord
	has_many :roles
	has_many :empleados
	has_many :registros

	has_many :clientes, through: :registros
end
