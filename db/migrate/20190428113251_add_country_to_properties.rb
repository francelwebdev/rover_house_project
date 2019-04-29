class AddCountryToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :country, :string
  end
end
