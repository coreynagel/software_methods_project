#encoding: utf-8

Feature: Profile Preferences
	A user has the ability to update their user information
	A user has the ability to clear their wall
	A user can see pending friend requests and list of friends

  Background:
    Given I am on my "profile preferences" page

  Scenario: Update user information
	When I fill out the "information" box
	And I press "save"
	Then I should see the new "information" box

  Scenario: Clear user's wall
	When I press "clear wall"
	Then I should see no "posts" on my wall

  Scenario: Pending friend requests
	Then I should see "pending" friend requests
	And I should be able to do the following: accept, ignore
	And I should see a list of my "friends"
    When I click "Foo Bar"
    Then I am on Foobar's profile page

  Scenario: remove friend
    Then I should see "Remove Friend"
    When I click "Remove Friend"
    Then I should not see "My Friend"
