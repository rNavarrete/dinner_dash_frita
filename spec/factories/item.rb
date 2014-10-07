FactoryGirl.define do
  factory :item do
    title "Oil of Ole"
    description "wonderful cuban paste"
    price 10.00
    categories { [build(:category)] }
    status 'active'
  end
end
