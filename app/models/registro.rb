class Registro < ApplicationRecord
	belongs_to :empresa
	belongs_to :cliente

	has_many :pedidos
end
