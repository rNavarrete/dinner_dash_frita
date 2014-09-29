class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: true
  #permit :password and password_confirmation
end
