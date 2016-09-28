class AddResponsavelToAtividades < ActiveRecord::Migration
  def change
    add_column :atividades, :responsavel, :string
  end
end
