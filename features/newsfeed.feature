#encoding: utf-8

Feature: Newsfeed
	Current user should see list of friend's posts as well as their own
	Friend's posts should include links to their profile pages

Scenario: View friends and own posts
	Given I am on my "newsfeed" page
	Then I should see a list of my own "posts"
	And I should see a list of my friends "posts"

Scenario: Links to friends profile pages
	Given I am on my "newsfeed" page
	When I click a friends "post"
	Then I should be on their "profile" page