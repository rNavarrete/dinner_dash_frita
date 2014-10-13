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
      expect(cart_path).to_not have_content 'Oil of Ole'
    end

    it 'can edit quantity of one item' do
      fill_in :quantity, with: "2"
      click_on 'Save'
      expect(page).to have_content '2'
    end

    it 'must log in to check out' do
      expect(page).to_not have_content 'How would you like to get your food?'
      expect(page).to have_content 'Login'
      expect(page).to have_content 'Create An Account'
    end
  end

  context 'after user logs in' do

    before do
      user = create(:user)
      within('.navbar-right') do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_on "Login"
      end

    describe 'chooses delivery' do
      before do
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
      end

        it "can set delivery address", :js do
          expect(page).to have_content 'Review Your Order'
          expect(page).to have_content '123 Sesame St.'
        end

        it 'can cancel an order' do
          within(:css, "#nav_bar") do
            click_on("Welcome, #{@user.name}")
          end
          expect(current_path).to eq user_orders_path(@user)
          save_and_open_page
          expect(page).to have_content "Order Status: ordered"
          click_on 'View Details'
          expect(current_path).to eq orders_path(1)
          click_on 'Cancel This Order'
          expect(page).to have_content "cancelled"
        end
    end

    describe 'chooses pickup' do
      before do
        visit cart_path
        save_and_open_page
        click_on("I'll PICK IT UP")
      end

      it "can review and edit order" do
        expect(current_path).to eq 'new?pickup_option=Pickup'
        expect(page).to have_content 'Review Your Order'
        fill_in :quantity, with: "2"
        click_on 'Save'
        click_on 'Complete My Order'
        expect(current_path).to eq order_path(1)
        expect(page).to have_content '2'
        expect(page).to have_content 'Order status: ordered'
      end

      xit "can see estimated wait time" do

      end
    end
  end
end

    #Given I have one item in my cart with a quantity of two
    #visit root_path
    #And I click 'Proceed to Checkout'
    #Then I see my cart contents
    #
end
