class Cliente < ApplicationRecord
	before_save :format_tel

	ESTADOS = ['activo', 'baja']

	FORM_FIELDS = [
		['nombre',              'entry'],
		['email',               'entry'],
		['direccion',           'entry'],
		['telefono',            'entry'],
		['zona_id',             'hidden'],
		['estado',              'hidden'],
		['creado_por',          'hidden'],
		['actualizado_por',     'hidden']
	]

	belongs_to :zona
	belongs_to :usuario, optional: true

	has_many :registros

	has_many :empresas, through: :registros

	validates :email, email: true    

	private

	  def format_tel
	    self.telefono = ApplicationController.helpers.d_tel(self.telefono) unless self.telefono.blank?
	  end
end
