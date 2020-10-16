class CategoriasController < ApplicationController
  before_action :set_categoria, only: [:show, :edit, :update, :destroy, :estado]

  # GET /categorias
  # GET /categorias.json
  def index
    @coleccion = Categoria.all
  end

  def seleccion
    @link_seleccion = "/productos/new?empresa_id=#{params[:empresa_id]}&categoria_id="
    @coleccion = Empresa.find(params[:empresa_id]).categorias
  end

  # GET /categorias/1
  # GET /categorias/1.json
  def show
  end

  # GET /categorias/new
  def new
    @objeto = Categoria.new(empresa_id: params[:empresa_id], estado: Categoria::ESTADOS[0])
  end

  # GET /categorias/1/edit
  def edit
  end

  # POST /categorias
  # POST /categorias.json
  def create
    @objeto = Categoria.new(categoria_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Categoria was successfully created.' }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categorias/1
  # PATCH/PUT /categorias/1.json
  def update
    respond_to do |format|
      if @objeto.update(categoria_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: 'Categoria was successfully updated.' }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categorias/1
  # DELETE /categorias/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: 'Categoria was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria
      @objeto = Categoria.find(params[:id])
    end

    def set_redireccion
      @redireccion = "/empresas/#{@objeto.empresa.id}?tab=#{@objeto.class.name.downcase.pluralize}&estado=#{@objeto.estado}"
    end

    # Only allow a list of trusted parameters through.
    def categoria_params
      params.require(:categoria).permit(:categoria, :empresa_id, :estado, :creado_por, :actualizado_por)
    end
end
