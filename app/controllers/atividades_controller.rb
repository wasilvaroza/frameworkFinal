class AtividadesController < ApplicationController
  before_action :set_atividade, only: [:show, :edit, :update, :destroy]

  # GET /atividades
  # GET /atividades.json
  def index
    # buscar o título
    @ptitulo = params[:ptitulo]
    # buscar o tipo
    @ptipo = params[:ptipo]
    # buscar o local
    @plocal = params[:plocal]
    
    filtro = "1=1"
    
    #Caso o título não esteja em branco no form. _busca
    if not(@ptitulo.nil?)
       filtro = filtro + " and tituloAtividade like '%"+@ptitulo+"%'"
    end
    #Caso o tipo não esteja em branco no form. _busca
    if not(@ptipo.nil?)
       filtro = filtro + " and tipo like '%"+@ptipo+"%'"
    end
    #Caso o local não esteja em branco no form. _busca
    if not(@plocal.nil?)
       filtro = filtro + " and local like '%"+@plocal+"%'"
    end

    #@atividades = Atividade.all
    @atividades = Atividade.where(filtro).order("tituloAtividade")

  end

  # GET /atividades/1
  # GET /atividades/1.json
  def show
  end

  # GET /atividades/new
  def new
    @atividade = Atividade.new
  end

  # GET /atividades/1/edit
  def edit
  end

  # POST /atividades
  # POST /atividades.json
  def create
    @atividade = Atividade.new(atividade_params)

    respond_to do |format|
      if @atividade.save
        format.html { redirect_to @atividade, notice: 'Atividade cadastrada com sucesso' }
        format.json { render :show, status: :created, location: @atividade }
      else
        format.html { render :new }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atividades/1
  # PATCH/PUT /atividades/1.json
  def update
    respond_to do |format|
      if @atividade.update(atividade_params)
        format.html { redirect_to @atividade, notice: 'Atividade atualizada com sucesso' }
        format.json { render :show, status: :ok, location: @atividade }
      else
        format.html { render :edit }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atividades/1
  # DELETE /atividades/1.json
  def destroy
    @atividade.destroy
    respond_to do |format|
      format.html { redirect_to atividades_url, notice: 'Atividade excluida' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atividade
      @atividade = Atividade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atividade_params
      params.require(:atividade).permit(:evento_id, :tituloAtividade, :assunto, :resumo, :tipo, :dataHora_inicio, :dataHora_fim, :local, :evento, :responsavel)
    end
end
