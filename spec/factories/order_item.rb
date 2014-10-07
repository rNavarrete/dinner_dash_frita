FactoryGirl.define do
  factory :order_item do
    item  { build(:item) }
    order { build(:order) }
  end
end
