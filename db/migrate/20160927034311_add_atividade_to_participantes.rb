class AddAtividadeToParticipantes < ActiveRecord::Migration
  def change
    add_reference :participantes, :atividade, index: true
    add_foreign_key :participantes, :atividades
  end
end
