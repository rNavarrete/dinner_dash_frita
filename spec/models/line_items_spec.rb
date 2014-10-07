require 'rails_helper'

describe 'line_item' do

  before do
    @test_item = create(:line_item)
  end

  it "is invalid without a quantity" do
    @test_item.quantity = nil
    expect(@test_item).to be_invalid
  end

  it "is invalid without a cart_id" do
    @test_item.cart_id = nil
    expect(@test_item).to be_invalid
  end

  it "is invalid without an item_id" do
    @test_item.item_id = nil
    expect(@test_item).to be_invalid
  end

  it "is invalid if quantity is above 20" do
    @test_item.quantity = 21
    expect(@test_item).to be_invalid
  end

  it "is invalid if quantity is less than 1" do
    @test_item.quantity = 0
    expect(@test_item).to be_invalid

    @test_item.quantity = -1
    expect(@test_item).to be_invalid
  end

end
