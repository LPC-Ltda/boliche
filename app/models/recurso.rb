class Recurso < ApplicationRecord
	# CONTROLADORES que NO despliegan el MENU SUPERIOR
	NOMENU_CONTROLLERS = ['confirmations', 'mailer', 'passwords', 'registrations', 'sessions', 'unlocks']

	# ACCIONES de "recursos_controller" que DESPLIEGAN TABS
	TAB_ACTIONS = ['tablas']
	# ACCIONES de "recursos_controller" que DESPLIEGAN TABLAS
	TABLE_ACTIONS = ['tablas']

	# TABS de la acción "tablas" de "recursos_controller"
	TABS = ['empresas']

	# CONTROL APLICACION
	NO_TABLAS = ['registros']

end
