require 'rails_helper'

describe 'create user' do

  before do
    @user = User.create(name: 'Joe', email: 'joe@example.com', username: 'joe', password: '1234', password_confirmation: '1234')
    visit(new_user_path)
  end

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
      fill_in 'name',     with: "#{@user.name}"
      fill_in 'password', with: "#{@user.password}"
      click_on 'Login'
    end

    expect(page).to have_content "Successfully Logged In"
  end


  it 'successfully logs out user' do
    within(:css, "#nav_bar") do
      fill_in 'name',     with: "#{@user.name}"
      fill_in 'password', with: "#{@user.password}"
      click_on('Login')
    end

    click_on('Logout')

    expect(page).to have_content 'Successfully Logged Out.'
  end


  it 'cannot login with incorrect password' do
    within(:css, "#nav_bar") do
      fill_in 'name',     with: "#{@user.name}"
      fill_in 'password', with: "incorrectpassword"
      click_on('Login')
    end

    expect(page).to have_content 'Invalid login.'
  end


  it 'cannot login with incorrect username' do
    within(:css, "#nav_bar") do
      fill_in 'name',     with: "incorrectname"
      fill_in 'password', with: "#{@user.password}"
      click_on('Login')
    end

    expect(page).to have_content 'Invalid login.'
  end
end



# describe 'user settings', :type => :feature, :js => true do
describe 'user settings' do

  before do
    @user = create(:user, name: "Jessica", password: "5555", password_confirmation: "5555")
    visit root_path
  end

  it 'correctly directs user to settings show page' do
    within(:css, "#nav_bar") do
      fill_in'name',     with: "#{@user.name}"
      fill_in'password', with: "#{@user.password}"
      click_on('Login')
    end

    click_on('Settings')

    expect(page).to have_content 'My Account Settings'
  end


  it 'allows user to edit user settings' do
      within(:css, "#nav_bar") do
        fill_in'name',     with: "#{@user.name}"
        fill_in'password', with: "#{@user.password}"
        click_on('Login')
      end

      within(:css, "#nav_bar") do
        click_on('Settings')
      end

      click_on('Edit Account Details')
      fill_in 'Name', with: 'NewName'
      click_on('Update Account')

      expect(page).to have_content 'Account Successfully Updated'
      expect(page).to have_content 'Account Settings'
      expect(page).to_not have_content "#{@user.name}"
    end


  it 'deletes a user account when requested' do
    within(:css, "#nav_bar") do
      fill_in'name',     with: "#{@user.name}"
      fill_in'password', with: "#{@user.password}"
      click_on('Login')
    end

    within(:css, "#nav_bar") do
      click_on('Settings')
    end

    click_on('Edit Account Details')
    click_on('Delete Account')

    expect(page).to have_content 'Successfully Deleted'
  end
end
