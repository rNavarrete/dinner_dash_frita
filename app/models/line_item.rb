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



## FROM ORDER
# belongs_to :user
# has_many :order_items
# has_many :items, through: :order_items

# validates :user, presence: true
# validates :items, presence:true
# validates_associated :items

# validates :status, inclusion: { in: ['ordered', 'cancelled', 'completed', 'paid'] }
# validates :pickup_or_delivery, inclusion: { in: ['pickup', 'delivery'] }

# validates :street_number, :street, :city, if: :delivery?
# validates :state, inclusion: { in: valid_state_code }, if: :delivery?
# validates :zip, format: { with: /\d{5}/ }

# def delivery?
#   pickup_or_delivery == 'delivery'
# end

# def valid_state_code
#   %(AK AL AR AS AZ CA CO CT DC DE FL GA GU HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA PR RI SC SD TN TX UT VA VI VT WA WI WV WY)
# end
