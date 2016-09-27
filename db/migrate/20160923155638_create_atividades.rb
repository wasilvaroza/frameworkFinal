class CreateAtividades < ActiveRecord::Migration
  def change
    create_table :atividades do |t|
      t.references :evento, index: true
      t.string :tituloAtividade
      t.string :assunto
      t.string :resumo
      t.string :tipo
      t.string :dataHora_inicio
      t.string :dataHora_fim
      t.string :local

      t.timestamps null: false
    end
    add_foreign_key :atividades, :eventos
  end
end
