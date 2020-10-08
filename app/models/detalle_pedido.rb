class DetallePedido < ApplicationRecord
	belongs_to :pedido
	belongs_to :producto

	has_many :agregados

	has_many :adicionales, through: :agregados
end
