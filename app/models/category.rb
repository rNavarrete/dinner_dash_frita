class Category < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, :description, uniqueness: true
end
