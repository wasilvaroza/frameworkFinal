class Atividade < ActiveRecord::Base
# belongs_to :evento
# has_many :participantes
  validates_presence_of :tituloAtividade, message:'A Atividade deve possuir um Titulo'
  validates_presence_of :assunto, message:'A Atividade deve possuir um Assunto'
  validates_presence_of :resumo, message:'A Atividade deve possuir um Resumo'
  validates_presence_of :tipo, message:'A Atividade deve possuir um Tipo' 
  validates_presence_of :local, message:'A Atividade deve possuir um Local'
end
