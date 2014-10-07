require 'rails_helper'

describe 'admin user', type: :feature do

  before do
    @user = User.create(name: 'joe', password: 'asdf', password_confirmation: 'asdf', admin: true)

  end

  it 'has a role of admin' do

    visit '/'
    fill_in 'name', with: "#{@user.name}"
    fill_in 'password', with: "#{@user.password}"
    click_on 'Login'
    expect(page).to have_content("Admin Options")
  end
end
