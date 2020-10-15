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
	FORM_FIELDS = [
		['zona',             'entry'],
		['tarifa',           'entry'],
		['empresa_id',      'hidden'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]
	TABLA_FIELDS = ['zona', 'tarifa']

	TIPO_NEW = 'child'
	PADRE = 'empresas'
 	
    validates_presence_of :zona, :tarifa
    validates_uniqueness_of :zona
end
