class ApplicationController < ActionController::Base
	# valida el uso de alias en las tablas
	def alias_tabla(controller)
		helpers.alias_tabla(controller)
	end

  def estado
    @objeto.estado = params[:estado]
    @objeto.save
    set_redireccion
    redirect_to @redireccion
  end
end
