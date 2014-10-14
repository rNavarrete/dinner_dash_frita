require 'rails_helper'


describe 'logged in administrator' do

  before do
      @user = create(:user, name: "bert", email: "bertrand@example.com", password: "12345", password_confirmation: "12345", admin: "true")
      visit root_path
      within('#nav_bar') do
        fill_in 'email', with: "#{@user.email}"
        fill_in 'password', with: "#{@user.password}"
      end
      click_on 'Login'
     expect(current_path).to eq admin_path
  end

  it 'can edit own admin account' do
    click_on 'Edit My Account'
    fill_in 'user[name]', with: "Elephant"
    click_on 'Update Account'
    expect(page).to have_content "Elephant"
  end

  it 'can delete own admin account' do
    click_on 'Edit My Account'
    click_on 'Delete Account'
    expect(current_path).to eq root_path
    expect(page).to_not have_content "Admin Options"
  end

  # it 'can delete users' do
  #   click_on "destroy"
  # end

  it 'can add an item to the menu' do
    visit admin_path
    within('.edit-items-container') do
      click_on 'Create a new item'
    end

    fill_in 'title', with: "Bananas"
    fill_in 'description', with: "Delicious"
    fill_in 'price', with: "98"
    select 'Desserts', from: 'categories'

    click_on 'Save Item'

    expect(current_path).to eq admin_path
    expect(page).to have_content "Bananas"
  end


  it 'can save an edited item' do
    @item = create(:item)
    visit admin_items_path(@item)
    click_on 'Edit'
    fill_in 'item[title]', with: "I changed it"
    click_on 'Save Item'
    expect(current_path).to eq admin_items_path
    expect(page).to have_content "I changed it"
  end

  # it 'can delete an item' do
  #   @item = create(:item)
  #   visit admin_items_path(@item)
  #
  #
  # end


  it 'can save an edited category' do
    @category = create(:category)
    visit admin_path
    within('.edit-categories-container') do
      click_on 'Edit'
    end
    fill_in 'category[title]', with: "Brand new category"
    click_on 'Save Category'

    expect(current_path).to eq admin_categories_path
    expect(page).to have_content "Brand new category"
  end

  # it 'can delete a category' do

end
