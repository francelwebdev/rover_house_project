class AddPropertyTypeAndAdTypeToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :property_type, :string
    add_index :properties, :property_type
    add_column :properties, :ad_type, :string
    add_index :properties, :ad_type
  end
end
