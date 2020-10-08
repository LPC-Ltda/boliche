class Cliente < ApplicationRecord
	belongs_to :zona
	belongs_to :usuario

	has_many :registros

	has_many :empresas, through: :registros
end
