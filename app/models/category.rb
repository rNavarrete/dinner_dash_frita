class Category < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, :description, uniqueness: true
  has_many  :items, through: :item_categories
  has_many  :item_categories
end
