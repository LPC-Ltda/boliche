class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy, :estado]

  # GET /registros
  # GET /registros.json
  def index
    @coleccion = Registro.all
  end

  # GET /registros/1
  # GET /registros/1.json
  def show
    @tab = params[:tab].blank? ? 'pedidos' : params[:tab]
    @estado = params[:estado].blank? ? @tab.classify.constantize::ESTADOS[0] : params[:estado]
    # tenemos que cubrir todos los casos
    # 1. has_many : }
    @coleccion = @objeto.send(alias_tabla(@tab)).where(estado: @estado)
    # @coleccion = @tab == 'clientes' ? @objeto.clientes.where(estado: @estado) : @tab.classify.constantize.where(empresa_id: @objeto.id, estado: @estado)
  end

  # GET /registros/new
  def new
    @objeto = Registro.new
  end

  # GET /registros/1/edit
  def edit
  end

  # POST /registros
  # POST /registros.json
  def create
    @objeto = Registro.new(registro_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: 'Registro was successfully created.' }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registros/1
  # PATCH/PUT /registros/1.json
  def update
    respond_to do |format|
      if @objeto.update(registro_params)
        format.html { redirect_to @objeto, notice: 'Registro was successfully updated.' }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registros/1
  # DELETE /registros/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to registros_url, notice: 'Registro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registro
      @objeto = Registro.find(params[:id])
    end

    def set_redireccion
      @redireccion = "/empresas/#{@objeto.empresa.id}?tab=#{@objeto.class.name.downcase.pluralize}&estado=#{@objeto.estado}"
    end

    # Only allow a list of trusted parameters through.
    def registro_params
      params.require(:registro).permit(:cliente_id, :empresa_id, :estado, :creado_por, :actualizado_por)
    end
end
