FactoryGirl.define do
  factory :address do
    association :user
    street_number "200"
    street "Elm St."
    city "Denver"
    state "CO"
    zip "80206"
  end
end
