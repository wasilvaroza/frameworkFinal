class Participante < ActiveRecord::Base

  validates_presence_of :nome, message:'O Participante deve possuir um Nome'
  validates_presence_of :rg, message:'O Participante deve possuir um RG'
  validates_presence_of :email, message:'O Participante deve possuir um Email'
  validates_presence_of :formacao, message:'O Participante deve possuir Formacao' 
  
  validates_uniqueness_of :rg, message: 'Participante ja cadastrado'

  mount_uploader :foto, FotoParticipanteUploader

  belongs_to :atividade

end
