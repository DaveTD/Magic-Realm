class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :state
      t.string :time_of_day
      t.timestamps
    end
  end
end
