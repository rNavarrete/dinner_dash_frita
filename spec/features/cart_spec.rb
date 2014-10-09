require 'rails_helper'

describe 'cart' do

  before do
    create(:item)
    visit '/'
    expect(page).to have_content "Oil of Ole"
    click_on 'Add to Cart'
    visit cart_path
    expect(page).to have_content "Your Cart"
  end
  #Given I have two items in my cart
  #When I look at the cart icon
  #I see the number two

  #Given I have one item in my cart
  #When I click my cart
  #I see my one item
  #I see my price
  #I edit quantity
  #I can remove items
  #I can checkout

  #Given I have one item in my cart with a quantity of two
  #visit root_path
  #And I click 'Proceed to Checkout'
  #Then I see my cart contents
  #
end
