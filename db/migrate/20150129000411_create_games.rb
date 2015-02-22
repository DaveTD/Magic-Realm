class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :time_of_day
      t.integer :turn
      t.integer :current_players_turn
      t.timestamps
    end
  end
end
