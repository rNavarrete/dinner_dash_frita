class Item < ActiveRecord::Base
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item
  # has_many :orders, through: :order_items

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://fillmurray.com/252/158"

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :title, :description, presence: true, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_file_name, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.' }
  validates :status, inclusion: { in: ['active', 'retired'] }

  private

   def ensure_not_referenced_by_any_line_item
     if line_items.empty?
       return true
     else
       errors.add(:base, 'Line Items present')
       return false
     end
   end

end
