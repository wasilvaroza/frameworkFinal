class MudarNomeColuna < ActiveRecord::Migration[5.0]
  def change
  	rename_column :atividades, :tituloatividade, :tituloatividade
  end
end
