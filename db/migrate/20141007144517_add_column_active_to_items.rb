class AddColumnActiveToItems < ActiveRecord::Migration
  def change
    add_column :items, :status, :string, default: 'active'
  end
end
