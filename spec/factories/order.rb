FactoryGirl.define do
  factory :order do
    association :user
    items { [build(:item)] }
    status "ordered"
    pickup_or_delivery "delivery"
    line_items { build(:line_item) }
  end
end
