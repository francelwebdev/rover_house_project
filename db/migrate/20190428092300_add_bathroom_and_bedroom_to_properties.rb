class AddBathroomAndBedroomToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :bathroom, :string
    add_column :properties, :bedroom, :string
  end
end
