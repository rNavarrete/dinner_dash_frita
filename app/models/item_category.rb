class ItemCategory < ActiveRecord::Base
  belongs_to :item
  belongs_to :category

  #item_id      - map to id in items table
  #catagory_id  - map to id in catagory table

end
