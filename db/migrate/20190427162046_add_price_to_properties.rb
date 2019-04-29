class AddPriceToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :price, :decimal, precision: 9, scale: 0
  end
end
