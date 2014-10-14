FactoryGirl.define do
  factory :order do
    association :user
    items { [build(:item)] }
    status "ordered"
    pickup_or_delivery "delivery"
    line_items { build(:line_item) }

    # street_number "200"
    # street "Elm St."
    # city "Denver"
    # state "CO"
    # zip "80206"
  end
end
