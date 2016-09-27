class CreateParticipantes < ActiveRecord::Migration
  def change
    create_table :participantes do |t|
      t.string :nome
      t.string :rg
      t.string :dataNasc
      t.string :email
      t.string :formacao

      t.timestamps null: false
    end
  end
end
