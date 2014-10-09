class AddColumnLineItemsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :line_items, :hstore
  end
end
