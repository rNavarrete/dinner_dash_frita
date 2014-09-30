require 'rails_helper'

describe 'create user' do
  before do
    User.create(name: 'test1', password_digest: '1234')
    visit(new_user_path)
  end

  it 'creates a new user' do
    fill_in 'Name', with: 'test47'
    fill_in('user[password]', :with => '1234')
    fill_in('user[password_confirmation]', :with => '1234')
    click_on('Create Account')
    expect(page).to have_content 'test47'
    expect(page).to_not have_content 'Login'
  end

  it 'cannot create user if username is taken' do
    fill_in('Name', with: 'test1')
    fill_in('Password', with: '0987')
    fill_in('Confirm Password', with: '0987')
    click_on('Create Account')
    expect(page).to have_content "Name has already been taken"

  end

  it "cannot create user if username passwords don't match" do
    fill_in('Name', with: 'test10')
    fill_in('Password', with: '0987')
    fill_in('Confirm Password', with: '0907')
    click_on('Create Account')
    expect(page).to have_content "Password_confirmation doesn't match Password"
  end
end

describe 'user login' do
  before do
    User.create(name: 'test1', password_digest: '1234')
    visit(users_path)
  end

  it 'correctly logs in with username and  password' do
    fill_in('Name', with: 'test1')
    fill_in('Password', with: '1234')
    fill_in('Confirm Password', with: '1234')
    click_on('Login')
    expect(page).to have_content 'Hello test1'
  end
  
  it 'successfully logs out user'

  end

  it 'cannot login with wrong password'
  it 'cannot login with wrong username'
end
