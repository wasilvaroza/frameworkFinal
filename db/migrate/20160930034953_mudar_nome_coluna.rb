class MudarNomeColuna < ActiveRecord::Migration[5.0]
  def change
  	rename_column :atividades, :tituloAtividade, :tituloatividade
  end
end
