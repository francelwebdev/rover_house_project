class AddAvailableToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :available, :boolean, default: false
  end
end
