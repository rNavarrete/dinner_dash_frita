require 'rails_helper'

describe 'address' do

  before do
    @address = create(:address)
  end

  it 'requires a valid zipcode' do
    @address.zip = 8020
    expect(@address).to_not be_valid

    @address.zip = 8020000
    expect(@address).to_not be_valid

    @address.zip = ""
    expect(@address).to_not be_valid

    @address.zip = nil
    expect(@address).to_not be_valid
  end

  it 'requires a street number' do
    @address.street_number = nil
    expect(@address).to_not be_valid

    @address.street_number = ""
    expect(@address).to_not be_valid

    @address.street_number = "my street"
    expect(@address).to_not be_valid
  end

  it 'requires a valid state' do
    @address.state = nil
    expect(@address).to_not be_valid

    @address.state = "California"
    expect(@address).to_not be_valid

    @address.state = "BQ"
    expect(@address).to_not be_valid
  end

end
