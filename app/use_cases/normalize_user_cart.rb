module NormalizeUserCart
  def self.call(user, session)
    # make sure that if they already have a cart, it's associated to their user
    # if they don't have a cart in their session or on their user, make them one
    # if they have a cart_id in session, and a cart on their user (and they're not the same cart)... consolidate or ignore or w/e
  end

  def user_cart?

    # if user does not have a cart  create a new cart associated with that user,
    # else use cart associated with user.
  end


end

