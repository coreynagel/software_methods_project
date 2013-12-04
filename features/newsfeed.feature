#encoding: utf-8

Feature: Newsfeed
	Current user should see list of friend's posts as well as their own
	Friend's posts should include links to their profile pages

  Background:
    Given I have an account
    And I am on "the home page"
    And I fill in "Email" with "foobar@example.com"
    And I fill in "Password" with "testing"
    And I press "Sign in"
    And I am on "the home page"

  Scenario: View friends and own posts
	Then I should see a list of my own "posts"
	And I should see a list of my friends "posts"

  Scenario: Links to friends profile pages
    Then I should see "Friends"
	When I click a friends name
	Then I should be on their profile page

