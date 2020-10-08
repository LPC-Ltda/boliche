class Rol < ApplicationRecord
	belongs_to :empresa

	has_many :empleados
end
