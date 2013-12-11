

FactoryGirl.define do
  factory :user do
    first_name     "Example"
    last_name   "User1"
    email    "user1@example.com"
    password "testing"
    password_confirmation "testing"
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end

end