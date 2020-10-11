class RecursosController < ApplicationController
#  before_action :set_recurso, only: [:show, :edit, :update, :destroy]

  # GET /recursos/tablas
  def tablas
    # Manejo de Tablas, Tabs y Estados
    @ftab = params[:ftab].blank? ? Recurso::TABS[0] : params[:ftab]
  end

  # GET /recursos/1
  # GET /recursos/1.json
  def show
  end

  # GET /recursos/new
  def new
    @objeto = Recurso.new
  end

  # GET /recursos/1/edit
  def edit
  end


  private
    # Use callbacks to share common setup or constraints between actions.
end
