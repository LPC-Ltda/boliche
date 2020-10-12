class ApplicationController < ActionController::Base
  def estado
    @objeto.estado = params[:estado]
    @objeto.save
    set_redireccion
    redirect_to @redireccion
  end
end
