


FactoryGirl.define do

  sequence :email do |n|
    "#{n}user@factory.com"
  end

  factory :user do
    first_name     "Example"
    last_name   "User"
    email
    password "testing"
    password_confirmation "testing"
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end

  factory :comment do
    content "blah blah blah"
    user
    micropost
  end

end