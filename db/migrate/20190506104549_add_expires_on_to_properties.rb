class AddExpiresOnToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :expires_on, :datetime
  end
end
