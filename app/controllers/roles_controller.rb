class RolesController < ApplicationController
  before_action :set_rol, only: [:show, :edit, :update, :destroy, :estado]

  # GET /roles
  # GET /roles.json
  def index
    @coleccion = Rol.all
  end

  def seleccion
    @link_seleccion = "/empleados/new?empresa_id=#{params[:empresa_id]}&rol_id="
    @coleccion = Empresa.find(params[:empresa_id]).roles
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @tab = params[:tab].blank? ? 'empleados' : params[:tab]
    @estado = params[:estado].blank? ? @tab.classify.constantize::ESTADOS[0] : params[:estado]
    # tenemos que cubrir todos los casos
    # 1. has_many : }
    @coleccion = @objeto.send(alias_tabla(@tab)).where(estado: @estado)
    # @coleccion = @tab == 'clientes' ? @objeto.clientes.where(estado: @estado) : @tab.classify.constantize.where(empresa_id: @objeto.id, estado: @estado)
  end

  # GET /roles/new
  def new
    @objeto = Rol.new(empresa_id: params[:empresa_id], estado: Rol::ESTADOS[0])
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @objeto = Rol.new(rol_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Rol was successfully created.' }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @objeto.update(rol_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Rol was successfully updated.' }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: 'Rol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rol
      @objeto = Rol.find(params[:id])
    end

    def set_redireccion
      @redireccion = "/empresas/#{@objeto.empresa.id}?tab=#{@objeto.class.name.downcase.pluralize}&estado=#{@objeto.estado}"
    end

    # Only allow a list of trusted parameters through.
    def rol_params
      params.require(:rol).permit(:rol, :empresa_id, :estado, :creado_por, :actualizado_por)
    end
end
