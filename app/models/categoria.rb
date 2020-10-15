class Categoria < ApplicationRecord
	belongs_to :empresa

	has_many :productos
end
