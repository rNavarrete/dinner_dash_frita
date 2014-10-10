require 'rails_helper'

describe 'order' do

  before do
    @order = Order.create(user_id: 1, line_items: {1 => 3}, status: 'ordered', pickup_or_delivery: 'delivery', street_number: 201, street: "Elm", state: "CO", city: "Denver", zip: 80206)
  end

  it 'is valid' do
    expect(@order).to be_valid
  end

  it 'requires a valid zipcode' do
    @order.zip = 8020
    expect(@order).to_not be_valid

    @order.zip = 8020000
    expect(@order).to_not be_valid

    @order.zip = ""
    expect(@order).to_not be_valid

    @order.zip = nil
    expect(@order).to_not be_valid
  end

  it 'requires a street number' do
    @order.street_number = nil
    expect(@order).to_not be_valid

    @order.street_number = ""
    expect(@order).to_not be_valid

    @order.street_number = "my street"
    expect(@order).to_not be_valid
  end

  it 'requires a valid state' do
    @order.state = nil
    expect(@order).to_not be_valid

    @order.state = "California"
    expect(@order).to_not be_valid

    @order.state = "BQ"
    expect(@order).to_not be_valid
  end

  it 'has a user_id' do
    @order.user_id = nil
    expect(@order).to_not be_valid
  end

  it 'must include one or more item with status of active' do
    @order.line_items = nil
    expect(@order).to_not be_valid
  end

  it 'requires user to choose either pickup or delivery option' do
    @order.pickup_or_delivery = nil
    expect(@order).to_not be_valid

    @order.pickup_or_delivery = "I come get it"
    expect(@order).to_not be_valid
  end

  it 'requires a status of "ordered", "completed", or "cancelled"' do
    @order.status = nil
    expect(@order).to_not be_valid

    @order.status = "layaway"
    expect(@order).to_not be_valid
  end
end
