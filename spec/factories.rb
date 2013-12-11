

FactoryGirl.define do
  factory :user do
    name     "Example User1"
    email    "user1@example.com"
    password "testing"
    password_confirmation "testing"
  end
end