FactoryGirl.define do
  factory :user do
    name    "Oliver Hunewald"
    email   "ohu@example.com"
    password  "abcd1234"
    password_confirmation "abcd1234"
  end
end