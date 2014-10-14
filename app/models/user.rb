class User < ActiveRecord::Base
  has_secure_password

  has_many :orders
  has_many :addresses

  validates :name, presence: true
  validates_length_of :username, in: 2..32, allow_blank: true
  validates :username, allow_blank: true, length: { in: 2..32 }, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  def admin?
    admin == true
  end

  def display_name
    username.empty? ? format(name) : format(username)
  end

  def format(name)
    name.split.map {|n| n.strip.capitalize}.join(" ")
  end

end
