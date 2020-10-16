class AdicionalesController < ApplicationController
  before_action :set_adicional, only: [:show, :edit, :update, :destroy, :estado]

  # GET /adicionales
  # GET /adicionales.json
  def index
    @coleccion = Adicional.all
  end

  # GET /adicionales/1
  # GET /adicionales/1.json
  def show
  end

  # GET /adicionales/new
  def new
    @objeto = Adicional.new
  end

  # GET /adicionales/1/edit
  def edit
  end

  # POST /adicionales
  # POST /adicionales.json
  def create
    @objeto = Adicional.new(adicional_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: 'Adicional was successfully created.' }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adicionales/1
  # PATCH/PUT /adicionales/1.json
  def update
    respond_to do |format|
      if @objeto.update(adicional_params)
        format.html { redirect_to @objeto, notice: 'Adicional was successfully updated.' }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adicionales/1
  # DELETE /adicionales/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to adicionales_url, notice: 'Adicional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adicional
      @objeto = Adicional.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adicional_params
      params.require(:adicional).permit(:adicional, :precio, :estado, :creado_por, :actualizado_por)
    end
end
