class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :cents
      t.string :colour
      t.integer :size
      t.string :category
      t.integer :on_hand
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
