class RenameAddress < ActiveRecord::Migration
  def change
    rename_column :orders, :address, :address_id
  end
end
