class ParticipantesController < ApplicationController
  before_action :set_participante, only: [:show, :edit, :update, :destroy]

  # GET /participantes
  # GET /participantes.json
  def index

    # buscar o título
    @pnome = params[:pnome]
    # buscar o RG
    @prg = params[:prg]
    # buscar o e-mail
    @pemail = params[:pemail]
    
    filtro = "1=1"
    
    #Caso o nome não esteja em branco no form. _busca
    if not(@pnome.nil?)
     filtro = filtro + " and nome like '%"+@pnome+"%'"
   end
    #Caso o e-mail não esteja em branco no form. _busca
    if not(@pemail.nil?)
     filtro = filtro + " and email like '%"+@pemail+"%'"
   end
    #Caso o RG não esteja em branco no form. _busca
    if not(@prg.nil?)
     filtro = filtro + " and rg like '%"+@prg+"%'"
   end

    #@participantes = Participante.all
    @participantes = Participante.where(filtro).order("nome").paginate(page: params[:page], per_page: 3)

  end

  # GET /participantes/1
  # GET /participantes/1.json
  def show
  end

  # GET /participantes/new
  def new
    @participante = Participante.new
  end

  # GET /participantes/1/edit
  def edit
  end

  # POST /participantes
  # POST /participantes.json
  def create
    @participante = Participante.new(participante_params)

    respond_to do |format|
      if @participante.save
        format.html { redirect_to @participante, notice: 'Participante cadastrado com sucesso' }
        format.json { render :show, status: :created, location: @participante }
      else
        format.html { render :new }
        format.json { render json: @participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participantes/1
  # PATCH/PUT /participantes/1.json
  def update
    respond_to do |format|
      if @participante.update(participante_params)
        format.html { redirect_to @participante, notice: 'Participante atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @participante }
      else
        format.html { render :edit }
        format.json { render json: @participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participantes/1
  # DELETE /participantes/1.json
  def destroy
    @participante.destroy
    respond_to do |format|
      format.html { redirect_to participantes_url, notice: 'Participante excluido' }
      format.json { head :no_content }
    end
  end

  def listar
    @participantes = Participante.all
    respond_to do |format|
        format.html
        format.pdf do
          pdf = ParticipantesReport.new(@participantes)
          send_data pdf.render, filename: 'ParticipantesListagem.pdf', :width => pdf.bounds.width, type: 'application/pdf', disposition: :inline, :page_size => "A4", :page_layout => :portrait
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participante
      @participante = Participante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participante_params
      params.require(:participante).permit(:nome, :rg, :dataNasc, :email, :formacao, :foto, :tituloatividade, :atividade_id, :atividade)
    end
  end
