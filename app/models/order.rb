class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items
  belongs_to :address

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
end
