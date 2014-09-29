class User < ActiveRecord::Base
  has_secure_password
  #permit :password and password_confirmation
end
