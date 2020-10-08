class Producto < ApplicationRecord
	has_many :detalle_pedidos

	has_many :pedidos, through: :detalle_pedidos
end
