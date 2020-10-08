class Adicional < ApplicationRecord
	has_many :agregados

	has_many :detalle_pedidos, through: :agregados
end
