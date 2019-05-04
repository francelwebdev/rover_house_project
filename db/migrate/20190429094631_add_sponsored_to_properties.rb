class AddSponsoredToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :sponsored, :boolean
  end
end
