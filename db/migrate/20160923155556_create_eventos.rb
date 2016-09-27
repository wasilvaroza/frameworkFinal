class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :titulo
      t.string :organizador
      t.string :local
      t.string :dataHora_inicio
      t.string :dataHora_fim
      t.string :assunto

      t.timestamps null: false
    end
  end
end
