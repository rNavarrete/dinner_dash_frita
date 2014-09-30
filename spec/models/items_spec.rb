require 'spec_helper'

describe "creating an item" do

  it "should have a title" do
    item = Item.create(title: "Crickets")
    expect(item.title).to eq "Crickets"
  end

  it "should have a description" do
    item = Item.create(description: "Crunchy")
    expect(item.description).to eq "Crunchy"
  end

  it "should have a price" do
    item = Item.create(price: 9.99)
    expect(item.price).to eq 9.99
  end


  it "should be invalid without title" do
    item = Item.create(title: nil, description: "Crunchy")
    expect(item).to_not be_valid
  end

  it "should be invalid without a description" do
    item = Item.create(description: nil, title: "Crickets" )
    expect(item).to_not be_valid
  end


  it "should be invalid unless price is a positive integer" do
    item = Item.create(title: "Oranges", description: "Tart")

    item.price = "dog"
    expect(item).to_not be_valid

    item.price = -1
    expect(item).to_not be_valid

    item.price = 0
    expect(item).to_not be_valid
  end

  def new_product(image_url)
    Item.new(title:       "Carrots",
              description: "Vitamin K",
              price:       1,
              image_file_name:   image_url)
  end

  it "should have an image_url with a valid extension" do
    good = %w{ donut.gif donut.jpg donut.png Donut.JPG Donut.Jpg http://a.b.c/x/y/z/donut.gif }
     bad = %w{ donut.doc donut.gif/more donut.gif.more }

     good.each {|file| expect(new_product(file)).to be_valid}
     bad.each  {|file| expect(new_product(file)).to_not be_valid}
  end




end
