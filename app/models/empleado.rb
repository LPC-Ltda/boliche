class Empleado < ApplicationRecord
	belongs_to :empresa
	belongs_to :rol
	belongs_to :usuario
end
