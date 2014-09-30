class Category < ActiveRecord::Base
  validates :title, :description, presence: true
  # has_many :items, through :item_categories
end
