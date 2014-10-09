class LineItem < ActiveRecord::Base
  belongs_to :item
  validates  :cart_id,  presence: true
  validates  :item_id,  presence: true
  validates  :quantity, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 20}

  def item
    Item.find(:item_id)
  end

  #item.title (in the view)
  #item.quantity
end
