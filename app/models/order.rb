require 'money'

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items

  # validates :zip, length: { maximum: 5}, format: { with: /\d{5}/ }, if: :delivery?
  # validates :street_number, presence: true, format: { with: /\d+/}, if: :delivery?
  # validates :state, presence: true, allow_nil: false, inclusion: { in: :valid_state_code}, if: :delivery?
  validates :user_id, presence: true
  validates :line_items, presence: true
  validates :pickup_or_delivery, presence: true, inclusion: { in: ['pickup', 'delivery'] }
  validates :status, presence: true, inclusion: { in: ['ordered', 'completed', 'cancelled'] }

  def delivery?
    pickup_or_delivery == 'delivery'
  end

  def valid_state_code
    %w(AK AL AR AS AZ CA CO CT DC DE FL GA GU HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA PR RI SC SD TN TX UT VA VI VT WA WI WV WY)
  end

  def stripe_total
    Money.new((subtotal * 100) , "USD").cents
  end

  def active_orders
    where(:status == "active")
  end

  def find_item(item_id)
    Item.find(item_id)
  end

  def subtotal
    items = {}
    line_items_array = line_items.to_a
    line_items_array.each do |id_and_item_array|
      item_id = id_and_item_array[0].scan(/\d+/)
      quantity = id_and_item_array[1].to_i
      items[item_id[0]] = quantity
    end
    total = 0
    items.each do |item_id, quantity|
      total += find_item(item_id).price * quantity
    end
    total
  end
end
