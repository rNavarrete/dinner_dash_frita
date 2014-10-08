module NormalizeUserCart
  def self.call(user, session)

    cart.user


    # make sure that if they already have a cart, it's associated to their user
    # if they don't have a cart in their session or on their user, make them one
    # if they have a cart_id in session, and a cart on their user (and they're not the same cart)... consolidate or ignore or w/e
  end
end
