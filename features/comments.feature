Feature:
  As a user
  when I post a comment on a micropost, it should
  appear on that microposts page

  Background:
    Given I have an account
    And I am on "the home page"
    And I fill in "Email" with "foobar@example.com"
    And I fill in "Password" with "testing"
    And I press "Sign in"
    And I have a micropost

    Scenario:
      When I visit my micropost page
      When I fill in "comment" with "my comment"
      And I press "Comment"
      Then I should see "my comment"

    Scenario:
      Given I am on "the home page"
      When I click "comment"
      Then I should see "Comments on this Post"
      And I should see "a micropost"