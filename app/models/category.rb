class Category < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, :description, uniqueness: true
  # has_many :items, through :item_categories
end
