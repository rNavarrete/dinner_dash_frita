require 'rails_helper'

describe 'cart' do
  before do
    create(:item, categories: [create(:category)])
    visit '/'
    expect(page).to have_content "Oil of Ole"
    click_on 'Add to Cart'
    visit cart_path
    expect(page).to have_content "Your Cart"
  end

  it "user can set delivery address", :js do
    click_on('Proceed to Checkout')
    click_on('Enter Your Delivery Information')
    expect(page).to have_content 'Enter Your Delivery Information'
    fill_in 'Street number', with: "123"
    fill_in 'Street', with: " Sesame St."
    fill_in 'City', with: "Denver"
    select 'CO', from: 'State'
    fill_in 'Zip', with: "80206"
    click_on 'Save Address'
    expect(page).to have_content 'Review Your Order'
    expect(page).to have_content '123 Sesame St.'
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
