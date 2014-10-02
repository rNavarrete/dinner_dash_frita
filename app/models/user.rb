class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: true

  def admin?
    admin == true
  end
end
