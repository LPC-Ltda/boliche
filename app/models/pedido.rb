class Pedido < ApplicationRecord
	belongs_to :registro

	has_many :detalle_pedidos
end
