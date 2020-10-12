class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:show, :edit, :update, :destroy, :estado]

  # GET /empresas
  # GET /empresas.json
  def index
    @coleccion = Empresa.all
  end

  # GET /empresas/1
  # GET /empresas/1.json
  def show
  end

  # GET /empresas/new
  def new
    @objeto = Empresa.new(estado: Empresa::ESTADOS[0])
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas
  # POST /empresas.json
  def create
    @objeto = Empresa.new(empresa_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Empresa was successfully created.' }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresas/1
  # PATCH/PUT /empresas/1.json
  def update
    respond_to do |format|
      if @objeto.update(empresa_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Empresa was successfully updated.' }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: 'Empresa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @objeto = Empresa.find(params[:id])
    end

    def set_redireccion
      @redireccion = "/recursos/tablas?ftab=#{@objeto.class.name.downcase.pluralize}&estado=#{@objeto.estado}"
    end

    # Only allow a list of trusted parameters through.
    def empresa_params
      params.require(:empresa).permit(:rut, :razon_social, :estado, :creado_por, :actualizado_por)
    end
end
