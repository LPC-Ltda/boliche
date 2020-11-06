class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy, :estado]
  after_action :create_registro, only: :create

  # GET /clientes
  # GET /clientes.json
  def index
    @coleccion = Cliente.all
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @empresa = Empresa.find(params[:empresa_id])
#    @r = @empresa.registros.create(estado: Registro::ESTADOS[0], cliente: Cliente.new(estado: Cliente::ESTADOS[0], zona_id: params[:zona_id]))
#    @objeto = @r.cliente
    @objeto = Cliente.new(estado: Cliente::ESTADOS[0], zona_id: params[:zona_id])
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @objeto = Cliente.new(cliente_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Cliente was successfully created.' }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @objeto.update(cliente_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: 'Cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @objeto = Cliente.find(params[:id])
    end

    def create_registro
      @objeto.registros << Registro.create(estado: Registro::ESTADOS[0], empresa_id: session[:session_empresa_id])
    end

    def set_redireccion
      @redireccion = "/empresas/#{session[:session_empresa_id]}?tab=#{@objeto.class.name.downcase.pluralize}&estado=#{@objeto.estado}"
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:nombre, :email, :direccion, :telefono, :zona_id, :usuario_id, :estado, :creado_por, :actualizado_por)
    end
end
