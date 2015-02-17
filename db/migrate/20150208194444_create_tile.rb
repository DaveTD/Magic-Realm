class CreateTile < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.string :name
    end
  end
end
