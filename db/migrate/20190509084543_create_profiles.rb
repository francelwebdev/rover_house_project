class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :profile_picture
      t.string :address

      t.timestamps
    end
  end
end
