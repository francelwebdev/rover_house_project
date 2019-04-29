class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.integer :area
      t.text :description

      t.timestamps
    end
  end
end
