class Registro < ApplicationRecord
	ESTADOS = ['activo', 'baja']

	D_TABLA = {
		titulo:  false,
		tabs:    false,
		paginas: false,
		estados: true,
		nuevo:   true
	}
	TABLA_FIELDS = [
		['nombre', 'fnormal'], 
		['email', 'fshow'], 
		['direccion', 'fnormal'], 
		['telefono', 'fnormal']
	]
	TIPO_NEW = 'join_display'
	LINK_SELECCION = "/zonas/seleccion"
	THROUGH_REF = 'empresas'
	F_TABLA = 'clientes'

	belongs_to :empresa
	belongs_to :cliente

	has_many :pedidos
end
