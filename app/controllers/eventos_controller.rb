class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]

  # GET /eventos
  # GET /eventos.json
  def index
    
    # buscar o título
    @ptitulo = params[:ptitulo]
    # buscar o organizador
    @porganizador = params[:porganizador]
    # buscar o local
    @plocal = params[:plocal]
    
    filtro = "1=1"
    
    #Caso o título não esteja em branco no form. _busca
    if not(@ptitulo.nil?)
       filtro = filtro + " and titulo like '%"+@ptitulo+"%'"
    end
    #Caso o organizador não esteja em branco no form. _busca

    if not(@porganizador.nil?)
       filtro = filtro + " and organizador like '%"+@porganizador+"%'"
    end
    
    #Caso o local não esteja em branco no form. _busca
    if not(@plocal.nil?)
       filtro = filtro + " and local like '%"+@plocal+"%'"
    end

    #@atividades = Atividade.all
    @eventos = Evento.where(filtro).order("titulo")
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'Evento criado com sucesso' }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to @evento, notice: 'Evento atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url, notice: 'Evento excluido' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:titulo, :organizador, :local, :dataHora_inicio, :dataHora_fim, :assunto)
    end
end
