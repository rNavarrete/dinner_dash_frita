require 'rails_helper'

describe 'cart' do
  before do
    create(:item, categories: [create(:category)])
    visit '/'
    expect(page).to have_content "Oil of Ole"
    click_on 'Add to Cart'
    visit cart_path
    expect(page).to have_content "Your Cart"
    expect(page).to have_content "Oil of Ole"
  end

  context 'before user logs in' do

    it 'can remove an item from the cart' do
      click_on('Remove')
      expect(page).to_not have_content 'Oil of Ole'
    end

    it 'can edit quantity of one item'

    it 'must log in to check out'


  end

  context 'after user logs in' do

    before do
      user = create(:user)
      within('.navbar-right') do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_on "Login"
      end
    end

    it "user can set delivery address", :js do
      visit cart_path
      expect(page).to have_content 'How would you like to get your food?'
      click_on('DELIVERY, please!')
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
  end

    #context 'logged out'
    #context 'logged in'

    #it 'can add item to cart'
    #it 'can view '

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
