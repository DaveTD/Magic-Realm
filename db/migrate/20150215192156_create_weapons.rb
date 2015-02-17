class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.boolean :ranged
      t.integer :length
      t.integer :price
      t.integer :harm
      t.boolean :sharp

      t.timestamps null: false
    end
  end
end
