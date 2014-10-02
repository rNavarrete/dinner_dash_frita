require 'rails_helper'

describe 'create user' do
  before do
    User.create(name: 'test1', password_digest: '1234')
    visit(new_user_path)
  end

  describe 'user creation happy path' do
    it 'creates a new user' do
      fill_in 'Name', with: 'test47'
      fill_in('user[password]', :with => '1234')
      fill_in('user[password_confirmation]', :with => '1234')
      click_on('Create Account')
      expect(page).to have_content 'Test47'
      expect(page).to_not have_content 'Login'
    end
  end

  describe 'user creation sad path' do
    it 'cannot create user if username is taken' do
      fill_in('Name', with: 'test1')
      fill_in('Password', with: '0987')
      fill_in('Confirm Password', with: '0987')
      click_on('Create Account')
      expect(page).to have_content 'Name has already been taken'
    end

    it 'cannot create user if username passwords don not match' do
      fill_in('Name', with: 'test10')
      fill_in('Password', with: '0987')
      fill_in('Confirm Password', with: '0907')
      click_on('Create Account')
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end
end

describe 'user login' do
  before do
    User.create(name: 'test1', password: '1234')
    visit(root_path)
    click_on('Login')
  end

  describe 'happy login path' do
    it 'correctly logs in with username and password' do
      within(:css, "#login") do
        fill_in('Name', with: 'test1')
        fill_in('Password', with: '1234')
        click_on('Login')
      end

      expect(page).to have_content 'Welcome, Test1!'
    end

    it 'successfully logs out user' do
      within(:css, "#login") do
        fill_in('Name', with: 'test1')
        fill_in('Password', with: '1234')
        click_on('Login')
      end
      click_on('Logout')

      expect(page).to have_content 'Successfully Logged Out.'
    end
  end

  describe 'sad login path' do
    it 'cannot login with wrong password' do
      within(:css, "#login") do
        fill_in('Name', with: 'test1')
        fill_in('Password', with: '0987')
        click_on('Login')
      end

      expect(page).to have_content 'Invalid login'
    end

    it 'cannot login with wrong username' do
      within(:css, "#login") do
        fill_in('Name', with: 'MangoMama')
        fill_in('Password', with: '1234')
        click_on('Login')
      end

      expect(page).to have_content 'Invalid login'
    end
  end
end

describe 'user orders' do
  it 'correctly directs user to settings page after logging in' do
    User.create(name: 'test1', password: '1234')
    visit(root_path)
    click_on('Login')
    within(:css, "#login") do
      fill_in('Name', with: 'test1')
      fill_in('Password', with: '1234')
      click_on('Login')
    end
    expect(page).to have_content 'Successfully Logged In'
    expect(page).to have_content 'Welcome, Test1!'
    expect(page).to have_content 'My Orders'
  end
end

describe 'user settings' do
  before do
    User.create(name: 'test1', password: '1234')
    visit(root_path)
    click_on('Login')
    within(:css, "#login") do
      fill_in('Name', with: 'test1')
      fill_in('Password', with: '1234')
      click_on('Login')
    end

    within(:css, "nav") do
      click_on('Settings')
    end
  end

  it 'correctly directs user to settings show page' do
    expect(page).to have_content 'Account Settings'
  end

  it 'correctly navigates to edit user settings page and updates name' do
    click_on('Edit Account Details')

    expect(page).to have_content 'Edit My Account'
    fill_in('Name', with: 'lalala')
    click_on('Update Account')

    expect(page).to have_content 'Account Successfully Updated'
    expect(page).to have_content 'Account Settings'
    expect(page).to have_content 'Welcome, Lalala!'
  end

  # it 'deletes a user account when requested' do
  #   click_on('Edit Account Details')
  #   expect(page).to have_content 'Edit My Account'
  #   click_on('Delete Account')
  #   expect(page).to have_content 'Successfully Deleted Test1'
  #   expect(page).to have_content 'Frita'
  # end
end
