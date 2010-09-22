class CreateVariations < ActiveRecord::Migration
  def self.up
    create_table :variations do |t|
      t.string :name
      t.integer :cents
      t.integer :product_id
      t.timestamps
    end
  end

  def self.down
    drop_table :variations
  end
end
