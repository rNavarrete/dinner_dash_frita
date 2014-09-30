require 'spec_helper'

describe "creating a category" do

  it "should have a title" do
    category = Category.new(title: "Crickets", description: "crunchy")
    expect(category.title).to eq "Crickets"
  end

  it "should have a description" do
    category = Category.new(description: "Crunchy")
    expect(category.description).to eq "Crunchy"
  end

  it "should be invalid without title" do
    category = Category.new(title: nil, description: "Crunchy")
    expect(category).to_not be_valid
  end

  it "should be invalid without a description" do
    category = Category.new(description: nil, title: "Crickets" )
    expect(category).to_not be_valid
  end
end
