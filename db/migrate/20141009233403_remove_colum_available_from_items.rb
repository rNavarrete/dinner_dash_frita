class RemoveColumAvailableFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :available
  end
end
