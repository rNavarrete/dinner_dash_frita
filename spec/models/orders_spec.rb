require 'rails_helper'

describe 'order' do

  before do
    let(:order) { create(:order) }
  end

  xit "is valid when all required fields are valid" do
    expect(order).to be_valid
  end

end
