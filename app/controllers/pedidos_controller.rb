class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy, :estado]

  # GET /pedidos
  # GET /pedidos.json
  def index
    @coleccion = Pedido.all
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    @tab = params[:tab].blank? ? 'detalle_pedidos' : params[:tab]
    @estado = params[:estado].blank? ? @tab.classify.constantize::ESTADOS[0] : params[:estado]
    # tenemos que cubrir todos los casos
    # 1. has_many : }
    @coleccion = @objeto.send(alias_tabla(@tab)).where(estado: @estado)
    # @coleccion = @tab == 'clientes' ? @objeto.clientes.where(estado: @estado) : @tab.classify.constantize.where(empresa_id: @objeto.id, estado: @estado)
  end

  # GET /pedidos/new
  def new
    @objeto = Pedido.new
  end
  def nuevo
    @objeto = Pedido.new(registro_id: params[:registro_id], hora_pedido: DateTime.now, estado: Pedido::ESTADOS[0])
    @objeto.save
    redirect_to @objeto
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @objeto = Pedido.new(pedido_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @objeto.update(pedido_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @objeto = Pedido.find(params[:id])
    end

    def set_redireccion
      @redireccion = "/registros/#{@objeto.registro.id}?tab=#{@objeto.class.name.downcase.pluralize}&estado=#{@objeto.estado}"
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:hora_pedido, :hora_entrega, :observacion, :registro_id, :estado, :creado_por, :actualizado_por)
    end
end
