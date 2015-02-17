class CreateTraversableClearing < ActiveRecord::Migration
  def change
    create_table :traversable_clearings do |t|
      t.references :clearing
      t.references :traversable
      t.boolean :hidden
    end
  end
end
