class Cart < ActiveRecord::Base
  class Null
    def line_items
      []
    end

    def item_count
      0
    end
  end

  has_many :line_items, dependent: :destroy

  def item_count
    line_items.sum(:quantity)
  end
end
