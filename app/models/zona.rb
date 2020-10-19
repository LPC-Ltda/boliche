class Zona < ApplicationRecord
	belongs_to :empresa

	has_many :clientes

	TABS = []
	ESTADOS = ['activa', 'baja']

	D_TABLA = {
		ftabs:   true,
		titulo:  true,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}
	D_SHOW = {
		titulo:   true,
		nav:      false,
		detalle:  true,
		tabs:     true,
		adjuntos: false,
		tablas:   false
	}
	FORM_FIELDS = [
		['zona',             'entry'],
		['tarifa',           'entry'],
		['empresa_id',      'hidden'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]
	TABLA_FIELDS = [
		['zona', 'show'], 
		['tarifa', 'normal']
	]
	SHOW_FIELDS = [
		['zona',             'normal'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]

	TIPO_NEW = 'child'
	PADRE = 'empresas'
 	
    validates_presence_of :zona, :tarifa
    validates_uniqueness_of :zona

	def nombre_display
		self.zona
	end
end
