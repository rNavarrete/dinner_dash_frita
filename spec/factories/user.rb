FactoryGirl.define do
  factory :user do
    name "John Snow"
    username "knownothing"
    email "winteriscoming@example.com"
    password "123"
    password_confirmation "123"
  end
end
