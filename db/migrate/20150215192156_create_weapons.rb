class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.string :weapon_name
      t.boolean :ranged
      t.integer :length
      t.integer :price
      t.integer :harm
      t.integer :alerted_harm
      t.integer :time
      t.integer :alerted_time
      t.integer :sharp
      t.integer :alerted_sharp

      t.timestamps null: false
    end
  end
end
