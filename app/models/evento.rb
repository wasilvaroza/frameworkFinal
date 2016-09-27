class Evento < ActiveRecord::Base

  validates_presence_of :titulo, message:'O Evento deve possuir um Titulo'
  validates_presence_of :organizador, message:'O Evento deve possuir um Organizador'
  validates_presence_of :assunto, message:'O Evento deve possuir um Assunto' 
  validates_presence_of :local, message:'O Evento deve possuir um Local'

end
