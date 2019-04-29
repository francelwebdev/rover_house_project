class AddCategoryToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :category, :string
  end
end
