class AgregadosController < ApplicationController
  before_action :set_agregado, only: [:show, :edit, :update, :destroy]

  # GET /agregados
  # GET /agregados.json
  def index
    @coleccion = Agregado.all
  end

  # GET /agregados/1
  # GET /agregados/1.json
  def show
  end

  # GET /agregados/new
  def new
    @objeto = Agregado.new
  end

  # GET /agregados/1/edit
  def edit
  end

  # POST /agregados
  # POST /agregados.json
  def create
    @objeto = Agregado.new(agregado_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: 'Agregado was successfully created.' }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agregados/1
  # PATCH/PUT /agregados/1.json
  def update
    respond_to do |format|
      if @objeto.update(agregado_params)
        format.html { redirect_to @objeto, notice: 'Agregado was successfully updated.' }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agregados/1
  # DELETE /agregados/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to agregados_url, notice: 'Agregado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agregado
      @objeto = Agregado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agregado_params
      params.require(:agregado).permit(:adicional_id, :detalle_pedido_id, :estado, :creado_por, :actualizado_por)
    end
end
