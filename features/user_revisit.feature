
Feature:
  As a User
  when I am signed in
  and I navigate away from the website and return
  I should still be signed in

    Background:
      Given I have an account
      And I am on "the home page"
      And I fill in "Email" with "foobar@example.com"
      And I fill in "Password" with "testing"
      And I press "Sign in"
      Then I am on "the home page"

    Scenario: navigate away and back
      Given I visit Google
      And I go to "the home page"
      Then I should see "Welcome Foo"

