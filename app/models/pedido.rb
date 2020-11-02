class Pedido < ApplicationRecord
	ESTADOS = ['ingreso', 'pago', 'preparación', 'despacho', 'entrega', 'baja']
	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}

 	TABLA_FIELDS = [
 		['id',          'show'], 
 		['hora_pedido', 'diahora'], 
 		['estado',      'normal']
 	]
	TIPO_NEW = 'child_nuevo'

	FORM_FIELDS = [
		['hora_pedido',      'entry'],
		['id',              'hidden'],
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
		tablas:   true
	}

	SHOW_FIELDS = [
		['estado',           'normal'],
		['estado',           'hidden'],
		['creado_por',       'hidden'],
		['actualizado_por',  'hidden']
	]


	belongs_to :registro

	has_many :detalle_pedidos
	def show_title
		"#{self.id} | #{ApplicationController.helpers.l(self.hora_pedido)}"
	end
end
