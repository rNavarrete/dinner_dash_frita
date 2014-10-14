class RemoveColumnsForAddressFromOrdersTable < ActiveRecord::Migration
  def change
    remove_column :orders, :street_number
    remove_column :orders, :street
    remove_column :orders, :city
    remove_column :orders, :state
    remove_column :orders, :zip
  end
end
