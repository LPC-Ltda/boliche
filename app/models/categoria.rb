class Categoria < ApplicationRecord
	ESTADOS = ['activa', 'baja']

	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}

	TABLA_FIELDS = [['categoria', 'show']]

	TIPO_NEW = 'child'
	PADRE = 'empresas'

	FORM_FIELDS = [
		['categoria',        'entry'],
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
		['categoria',       'normal'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]

	belongs_to :empresa

	has_many :productos

	def show_title
		self.categoria
	end
end
