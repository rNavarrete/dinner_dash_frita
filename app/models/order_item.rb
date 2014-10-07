class OrderItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :order, presence: true
  validates :item, presence: true
end
