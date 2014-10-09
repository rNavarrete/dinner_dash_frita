class Cart < ActiveRecord::Base
   has_many :line_items, dependent: :destroy
   belongs_to :user


  class Null
    def line_items
      []
    end

    def item_count
      0
    end
  end


  def item_count
    line_items.sum(:quantity)
  end
end
