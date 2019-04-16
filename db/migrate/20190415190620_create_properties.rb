class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :title
      t.decimal :price, precision: 8, scale: 0
      t.integer :area
      t.text :description

      t.timestamps
    end
  end
end
