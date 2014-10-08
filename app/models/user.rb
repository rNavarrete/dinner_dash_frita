class User < ActiveRecord::Base
  has_secure_password

  has_many :order_items

  validates :name, presence: true
  validates :username,  length: { in: 2..32, allow_nil: true },
                        uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  def admin?
    admin == true
  end
end
