require 'rails_helper'

RSpec.describe NormalizeUserCart do
  specify 'if they already have a cart, it\'s associated to their user' do
    user = User.new cart_id: 123
    session = {}
    NormalizeUserCart.call user, session
    expect(session[:cart_id]).to eq 123
  end

  # it 'if they don't have a cart in their session or on their user, make them one
  # it 'if they have a cart_id in session, and a cart on their user (and they're not the same cart)... consolidate or ignore or w/e
end
