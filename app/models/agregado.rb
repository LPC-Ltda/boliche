class Agregado < ApplicationRecord
	belongs_to :adicional
	belongs_to :detalle_pedido
end
