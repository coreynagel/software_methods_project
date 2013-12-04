#encoding: utf-8

Feature: Profile Preferences
	A user has the ability to update their user information
	A user has the ability to clear their wall
	A user can see pending friend requests and list of friends

Scenario: Update user information
	Given I am on my "profile preferences" page
	When I fill out the "information" box
	And I press "save"
	Then I should see the new "information" box

Scenario: Clear user's wall
	Given I am on my "profile preferences" page
	When I press "clear wall"
	Then I should see no "posts" on my wall

Scenario: Pending friend requests
	Given I am on my "profile preferences" page
	Then I should see "pending" friend requests
	And I should be able to do the following: accept, deny
	And I should see a list of my "friends"