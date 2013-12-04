

Feature: Visitor Redirect to login Page
  As a visitor
  If I visit a page other than the main page
  I should be sent to the main login page

  Scenario: visitor sent to sign in from users page
    Given Foobar has an account
    When I visit Foobar's user page
    Then I should see "Sign In"
    And I should not see "Foo Bar"

  Scenario: visitor sent to sign in from micropost page
    Given Foobar has an account
    And Foobar has a micropost
    When I visit Foobar's micropost page
    Then I should see "Sign In"