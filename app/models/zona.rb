class Zona < ApplicationRecord

	ESTADOS = ['activa', 'baja']

	D_TABLA = {
		ftabs:   true,
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}

	TABLA_FIELDS = [
		['zona', 'show'], 
		['tarifa', 'normal']
	]

	TIPO_NEW = 'child_new'
 	
	FORM_FIELDS = [
		['zona',             'entry'],
		['tarifa',           'entry'],
		['empresa_id',      'hidden'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]

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

	belongs_to :empresa

	has_many :clientes

    validates_presence_of :zona, :tarifa
    validates_uniqueness_of :zona

	def show_title
		self.zona
	end
end
