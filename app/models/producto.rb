class Producto < ApplicationRecord
	belongs_to :empresa
	belongs_to :categoria

	has_many :detalle_pedidos

	has_many :pedidos, through: :detalle_pedidos
end
