class Categoria < ApplicationRecord
	TABS = []
	ESTADOS = ['activa', 'baja']
	D_TABLA = {
		titulo:  false,
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
		['categoria',        'entry'],
		['empresa_id',      'hidden'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]

	SHOW_FIELDS = [
		['categoria',       'normal'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]
	TABLA_FIELDS = [['categoria', 'show']]

	TIPO_NEW = 'child'
	PADRE = 'empresas'

	belongs_to :empresa

	has_many :productos

	def nombre_display
		self.categoria
	end
end
