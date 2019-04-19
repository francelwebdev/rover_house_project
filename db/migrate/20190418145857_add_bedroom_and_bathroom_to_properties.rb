class AddBedroomAndBathroomToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :bedroom, :string
    add_column :properties, :bathroom, :string
  end
end
