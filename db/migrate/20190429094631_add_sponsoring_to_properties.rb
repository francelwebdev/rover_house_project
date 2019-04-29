class AddSponsoringToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :sponsoring, :boolean, default: false
  end
end
