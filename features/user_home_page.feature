
  Feature:
    As a user
    when I am signed in
    and I visit the main page
    I should see my newsfeed

    Background:
      Given I have an account
      And I am on "the home page"
      And I fill in "Email" with "foobar@example.com"
      And I fill in "Password" with "testing"
      And I press "Sign in"

    Scenario: home page shows newsfeed
      When I am on "the home page"
      Then I should see "Newsfeed"
