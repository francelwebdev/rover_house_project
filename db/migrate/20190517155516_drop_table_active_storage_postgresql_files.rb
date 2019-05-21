class DropTableActiveStoragePostgresqlFiles < ActiveRecord::Migration[5.2]
  def change
    drop_table :active_storage_postgresql_files
  end
end
