class AddVerifiedToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :verified, :boolean, default: false
  end
end
