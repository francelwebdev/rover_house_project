class AddCityAndAddressAndLocationToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :city, :string
    add_column :properties, :address, :string
    add_column :properties, :location, :string
  end
end
