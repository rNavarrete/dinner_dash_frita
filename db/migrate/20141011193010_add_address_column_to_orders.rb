class AddAddressColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :address, :integer
  end
end
