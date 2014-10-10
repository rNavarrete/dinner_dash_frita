class Cart
  def initialize(session)
    @session ||= session
  end

  def line_items
    @session[:cart_items] ||= {}
  end

  def add_line_item(item_id, quantity)
    line_items[item_id] = quantity
  end

  
end
