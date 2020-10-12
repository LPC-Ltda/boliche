class Empresa < ApplicationRecord

	TABS = []

	ESTADOS = ['ingreso', 'activa', 'baja']

	D_TABLA = {
		ftabs:   true,
		titulo:  true,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}

	FORM_FIELDS = [
		['rut',             'entry'],
		['razon_social',    'entry'],
		['estado',          'hidden'],
		['creado_por',      'hidden'],
		['actualizado_por', 'hidden']
	]

	has_many :roles
	has_many :empleados
	has_many :registros

	has_many :clientes, through: :registros

    validates_presence_of :rut, :razon_social
    validates_uniqueness_of :rut

	#validates :rut, rut_valido: true

	TABLA_FIELDS = ['rut', 'razon_social']

	def rut_display
		rut_base = self.rut.tr('.-', '').length == 8 ? '0'+self.rut.tr('.-', '') : self.rut.tr('.-', '')
		rut_base.reverse.insert(1, '-').insert(5, '.').insert(9, '.').reverse
	end
end
