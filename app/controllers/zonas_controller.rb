class ZonasController < ApplicationController
  before_action :set_zona, only: [:show, :edit, :update, :destroy, :estado]

  # GET /zonas
  # GET /zonas.json
  def index
    @coleccion = Zona.all
  end

  # GET /zonas/1
  # GET /zonas/1.json
  def show
  end

  # GET /zonas/new
  def new
    @objeto = Zona.new(estado: Zona::ESTADOS[0])
  end

  # GET /zonas/1/edit
  def edit
  end

  # POST /zonas
  # POST /zonas.json
  def create
    @objeto = Zona.new(zona_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Zona was successfully created.' }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zonas/1
  # PATCH/PUT /zonas/1.json
  def update
    respond_to do |format|
      if @objeto.update(zona_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Zona was successfully updated.' }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zonas/1
  # DELETE /zonas/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: 'Zona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zona
      @objeto = Zona.find(params[:id])
    end

    def set_redireccion
      @redireccion = "/recursos/tablas?ftab=#{@objeto.class.name.downcase.pluralize}&estado=#{@objeto.estado}"
    end

    # Only allow a list of trusted parameters through.
    def zona_params
      params.require(:zona).permit(:zona, :tarifa, :estado, :creado_por, :actualizado_por)
    end
end
