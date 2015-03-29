class CreateTraversableClearing < ActiveRecord::Migration
  def change
    create_table :traversable_clearings do |t|
      t.references :clearing
      t.references :traversable
      t.boolean :enchanted
      t.boolean :hidden
      t.string :hidden_type
      t.boolean :e_hidden
      t.string :e_hidden_type
    end
  end
end
