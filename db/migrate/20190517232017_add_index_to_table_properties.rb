class AddIndexToTableProperties < ActiveRecord::Migration[5.2]
  def change
    add_index :properties, [:city, :price, :area]
  end
end
