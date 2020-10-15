class EmpleadosController < ApplicationController
  before_action :set_empleado, only: [:show, :edit, :update, :destroy]

  # GET /empleados
  # GET /empleados.json
  def index
    @coleccion = Empleado.all
  end

  # GET /empleados/1
  # GET /empleados/1.json
  def show
  end

  # GET /empleados/new
  def new
    @objeto = Empleado.new(empresa_id: params[:empresa_id], rol_id: params[:rol_id], estado: Empleado::ESTADOS[0])
  end

  # GET /empleados/1/edit
  def edit
  end

  # POST /empleados
  # POST /empleados.json
  def create
    @objeto = Empleado.new(empleado_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Empleado was successfully created.' }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empleados/1
  # PATCH/PUT /empleados/1.json
  def update
    respond_to do |format|
      if @objeto.update(empleado_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Empleado was successfully updated.' }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empleados/1
  # DELETE /empleados/1.json
  def destroy
    @objeto.destroy
    set_redireccion
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: 'Empleado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empleado
      @objeto = Empleado.find(params[:id])
    end

    def set_redireccion
      @redireccion = "/empresas/#{@objeto.empresa.id}?tab=#{@objeto.class.name.downcase.pluralize}&estado=#{@objeto.estado}"
    end

    # Only allow a list of trusted parameters through.
    def empleado_params
      params.require(:empleado).permit(:rut, :nombre, :apellido_paterno, :apellido_materno, :rol, :email, :rol_id, :empresa_id, :usuario_id, :estado, :creado_por, :actualizado_por)
    end
end
