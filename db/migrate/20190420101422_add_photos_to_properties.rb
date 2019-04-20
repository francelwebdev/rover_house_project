class AddPhotosToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :photos, :json
  end
end
