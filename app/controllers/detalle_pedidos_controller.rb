class DetallePedidosController < ApplicationController
  before_action :set_detalle_pedido, only: [:show, :edit, :update, :destroy]

  # GET /detalle_pedidos
  # GET /detalle_pedidos.json
  def index
    @coleccion = DetallePedido.all
  end

  # GET /detalle_pedidos/1
  # GET /detalle_pedidos/1.json
  def show
  end

  # GET /detalle_pedidos/new
  def new
    @objeto = DetallePedido.new
  end

  def nuevo
    @objeto = DetallePedido.new(pedido_id: params[:pedido_id], producto_id: params[:producto_id], estado: DetallePedido::ESTADOS[0])
    @objeto.save
    redirect_to @objeto.pedido
  end

  # GET /detalle_pedidos/1/edit
  def edit
  end

  # POST /detalle_pedidos
  # POST /detalle_pedidos.json
  def create
    @objeto = DetallePedido.new(detalle_pedido_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Detalle pedido was successfully created.' }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_pedidos/1
  # PATCH/PUT /detalle_pedidos/1.json
  def update
    respond_to do |format|
      if @objeto.update(detalle_pedido_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Detalle pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_pedidos/1
  # DELETE /detalle_pedidos/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: 'Detalle pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_pedido
      @objeto = DetallePedido.find(params[:id])
    end

    def set_redireccion
      @redireccion = "/pedidos/#{@objeto.pedido.id}?tab=#{@objeto.class.table_name}&estado=#{@objeto.estado}"
    end

    # Only allow a list of trusted parameters through.
    def detalle_pedido_params
      params.require(:detalle_pedido).permit(:cantidad, :observacion, :pedido_id, :producto_id, :estado, :creado_por, :actualizado_por)
    end
end
