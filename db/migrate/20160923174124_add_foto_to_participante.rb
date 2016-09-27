class AddFotoToParticipante < ActiveRecord::Migration
  def change
    add_column :participantes, :foto, :string
  end
end
