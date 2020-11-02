class Empresa < ApplicationRecord
	before_save :format_rut
	# MODELO
	ESTADOS = ['ingreso', 'activa', 'baja']

	# TABLA
	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}

	TABLA_FIELDS = [
		['rut',          'show'], 
		['razon_social', 'normal']
	]

	TIPO_NEW = 'new'

	FORM_FIELDS = [
		['rut',             'entry'],
		['razon_social',    'entry'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]

	# SHOW
	D_SHOW = {
		titulo:   true,
		nav:      false,
		detalle:  true,
		tabs:     true,
		adjuntos: false,
		tablas:   false
	}

	SHOW_FIELDS = [
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]


	has_many :empleados
	has_many :categorias
	has_many :productos
	has_many :zonas

	has_many :registros

	has_many :clientes, through: :registros

    validates_presence_of :rut, :razon_social
    validates_uniqueness_of :rut

	validates :rut, rut_valido: true

	# Puede estar obsoleto, se implementó en application_helper
	def rut_display
		rut_base = self.rut.tr('.-', '').length == 8 ? '0'+self.rut.tr('.-', '') : self.rut.tr('.-', '')
		rut_base.reverse.insert(1, '-').insert(5, '.').insert(9, '.').reverse
	end
	def show_title
		"#{ApplicationController.helpers.d_rut(self.rut)} | #{self.razon_social}"
	end

	private

	  def format_rut
	    self.rut = ApplicationController.helpers.d_rut(self.rut) unless self.rut.blank?
	  end
end
