require 'rails_helper'

describe 'create user' do

  before do
    @user = User.create(name: 'Joe', email: 'joe@example.com', username: 'joe', password: '1234', password_confirmation: '1234')
    visit(new_user_path)
  end

  describe 'user creation happy path' do
    it 'creates a new user' do
      within(:css, "#register-user") do
        fill_in 'Name',             with: 'happyuser'
        fill_in 'Email',            with: 'happyuser@example.com'
        fill_in 'Username',         with: 'happyuser'
        fill_in 'Password',         with: '1111'
        fill_in 'Confirm Password', with: '1111'
        click_on('Create Account')
      end

      expect(page).to have_content 'Happyuser'
      expect(page).to have_content 'Logout'
    end
  end


  describe 'user creation sad path' do
    it 'cannot create user if username is taken' do
      within(:css, "#register-user") do
        fill_in 'Name',             with: 'saduser'
        fill_in 'Email',            with: 'saduser@example.com'
        fill_in 'Username',         with: 'joe'
        fill_in 'Password',         with: '1111'
        fill_in 'Confirm Password', with: '1111'

        click_on('Create Account')
      end

      expect(page).to have_content 'Username has already been taken'
      expect(page).to_not have_content 'Logout'
    end
  end


  describe 'user creation sad path' do
    it "cannot create user if password doesn't match password confirmation" do
      within(:css, "#register-user") do
        fill_in 'Name',             with: 'user'
        fill_in 'Email',            with: 'user@example.com'
        fill_in 'Username',         with: 'user'
        fill_in('Password',         with: '1111')
        fill_in('Confirm Password', with: '9999')
        click_on('Create Account')
      end

      expect(page).to have_content "Password confirmation doesn't match Password"
      expect(page).to_not have_content 'Logout'
    end
  end




  describe 'user login' do

    before do
      @user = create(:user, name: "Joe", password: "1234", password_confirmation: "1234")
      visit root_path
    end

    it "can log in a user with an established username and password" do
      within(:css, "#nav_bar") do
        fill_in 'name', with: "#{@user.name}"
        fill_in 'password', with: "#{@user.password}"
        click_on 'Login'

        expect(page).to have_content "Welcome, #{@user.name}"

        # why isn't the expect(page) working????
      end
    end
  end


  # -------------------------------------





  #   it 'successfully logs out user' do
  #     within(:css, "#login") do
  #       fill_in('Name', with: 'test1')
  #       fill_in('Password', with: '1234')
  #       click_on('Login')
  #     end
  #     click_on('Logout')
  #
  #     expect(page).to have_content 'Successfully Logged Out.'
  #   end
  # end
#
#   describe 'sad login path' do
#     it 'cannot login with wrong password' do
#       within(:css, "#login") do
#         fill_in('Name', with: 'test1')
#         fill_in('Password', with: '0987')
#         click_on('Login')
#       end
#
#       expect(page).to have_content 'Invalid login'
#     end
#
#     it 'cannot login with wrong username' do
#       within(:css, "#login") do
#         fill_in('Name', with: 'MangoMama')
#         fill_in('Password', with: '1234')
#         click_on('Login')
#       end
#
#       expect(page).to have_content 'Invalid login'
#     end
#   end
#
# describe 'user orders' do
#   it 'correctly directs user to settings page after logging in' do
#     User.create(name: 'test1', password: '1234')
#     visit(root_path)
#     click_on('Login')
#     within(:css, "#login") do
#       fill_in('Name', with: 'test1')
#       fill_in('Password', with: '1234')
#       click_on('Login')
#     end
#     expect(page).to have_content 'Successfully Logged In'
#     expect(page).to have_content 'Welcome, Test1!'
#     expect(page).to have_content 'My Orders'

#   end
# end
#
# describe 'user settings' do
#   before do
#     User.create(name: 'test1', password: '1234')
#     visit(root_path)
#     click_on('Login')
#     within(:css, "#login") do
#       fill_in('Name', with: 'test1')
#       fill_in('Password', with: '1234')
#       click_on('Login')
#     end
#
#     within(:css, "nav") do
#       click_on('Settings')
#     end
#   end
#
#   it 'correctly directs user to settings show page' do
#     expect(page).to have_content 'Account Settings'
#   end
#
#   it 'correctly navigates to edit user settings page and updates name' do
#     click_on('Edit Account Details')
#
#     expect(page).to have_content 'Edit My Account'
#     fill_in('Name', with: 'lalala')
#     click_on('Update Account')
#
#     expect(page).to have_content 'Account Successfully Updated'
#     expect(page).to have_content 'Account Settings'
#     expect(page).to have_content 'Welcome, Lalala!'
#   end
  # it 'deletes a user account when requested' do
  #   click_on('Edit Account Details')
  #   expect(page).to have_content 'Edit Account'
  #   click_on('Delete Account')
  #   accept_prompt do
  #     click_link('Ok')
  #   end
  #   expect(page).to have_content 'Successfully Deleted Test1'
  #   expect(page).to have_content 'Frita'
  # end
end
