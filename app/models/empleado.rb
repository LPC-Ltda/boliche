class Empleado < ApplicationRecord
	TABS = []
	ESTADOS = ['activo', 'baja']
	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}

	FORM_FIELDS = [
		['rut',                 'entry'],
		['nombre',              'entry'],
		['apellido_paterno',    'entry'],
		['apellido_materno',    'entry'],
		['email',               'entry'],
		['empresa_id',          'hidden'],
		['rol_id',              'hidden'],
		['estado',              'hidden'],
		['creado_por',          'hidden'],
		['actualizado_por',     'hidden']
	]

 	TABLA_FIELDS = [
 		['rut', 'show'], 
 		['nombre', 'display'], 
 		['email', 'normal']
 	]

	TIPO_NEW = 'child_sel'
	LINK_SELECCION = "/roles/seleccion"
	PADRE = 'empresas'

	belongs_to :empresa
	belongs_to :rol
	belongs_to :usuario, optional: true

    validates_presence_of :rut, :nombre, :apellido_paterno, :apellido_materno, :email, :empresa_id, :rol_id
    validates_uniqueness_of :rut

	validates :rut, rut_valido: true

	# Puede estar obsoleto, se implementó en application_helper
	def rut_display
		rut_base = self.rut.tr('.-', '').length == 8 ? '0'+self.rut.tr('.-', '') : self.rut.tr('.-', '')
		rut_base.reverse.insert(1, '-').insert(5, '.').insert(9, '.').reverse
	end
	def nombre_display
		"#{self.nombre} #{self.apellido_paterno} #{self.apellido_materno}"
	end
end
