class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items

<<<<<<< HEAD
  validates :zip, length: { maximum: 5}, format: { with: /\d{5}/ }, if: :delivery?
  validates :street_number, presence: true, format: { with: /\d+/}, if: :delivery?
  validates :state, presence: true, allow_nil: false, inclusion: { in: :valid_state_code}, if: :delivery?
  validates :user_id, presence: true
  validates :line_items, presence: true
  validates :pickup_or_delivery, presence: true, inclusion: { in: ['pickup', 'delivery'] }
  validates :status, presence: true, inclusion: { in: ['ordered', 'completed', 'cancelled'] }
=======
  validates :user, presence: true
  validates :items, presence: true
  validates_associated :items

  validates :status, inclusion: { in: ['ordered', 'cancelled', 'completed', 'paid'] }
  validates :pickup_or_delivery, inclusion: { in: ['pickup', 'delivery'] }

  # validates :street_number, :street, :city, if: :delivery?
  # validates :state, inclusion: { in: valid_state_code }, if: :delivery?
  validates :zip, format: { with: /\d{5}/ }
>>>>>>> ced7b257692d6546190a69d399faa54f3ab493a8

  def delivery?
    pickup_or_delivery == 'delivery'
  end

  def valid_state_code
    %w(AK AL AR AS AZ CA CO CT DC DE FL GA GU HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA PR RI SC SD TN TX UT VA VI VT WA WI WV WY)
  end
end
