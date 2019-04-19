class AddCountryRefToProperties < ActiveRecord::Migration[5.2]
  def change
    add_reference :properties, :country, foreign_key: true
  end
end
