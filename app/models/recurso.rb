class Recurso < ApplicationRecord
	NOMENU_CONTROLLERS = ['confirmations', 'mailer', 'passwords', 'registrations', 'sessions', 'unlocks']
	TAB_ACTIONS = ['tablas']
	TABLE_ACTIONS = ['tablas', 'zonas']

	TABS = ['empresas', 'zonas']

	# CONTROL APLICACION
	NO_TABLAS = ['registros']

end
