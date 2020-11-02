class Empleado < ApplicationRecord
	before_save :format_rut

	ESTADOS = ['activo', 'baja']

	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}

 	TABLA_FIELDS = [
 		['rut', 'show'], 
 		['nombre', 'display'], 
 		['email', 'normal']
 	]

	TIPO_NEW = 'child_sel'
	SELECTOR = "roles"

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

	D_SHOW = {
		titulo:   true,
		nav:      false,
		detalle:  true,
		tabs:     false,
		adjuntos: false,
		tablas:   false
	}
 	
	SHOW_FIELDS = [
		['email',            'normal'],
		['estado',           'hidden'],
		['creado_por',       'hidden'],
		['actualizado_por',  'hidden']
	]

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
	def show_title
		"#{ApplicationController.helpers.d_rut(self.rut)} | #{self.nombre} #{self.apellido_paterno} #{self.apellido_materno}"
	end

  private

	  def format_rut
	    self.rut = ApplicationController.helpers.d_rut(self.rut) unless self.rut.blank?
	  end
end
