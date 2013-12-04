#encoding utf-8

Feature: Add Friend From Search
	as a user, 
	on the search results page, 
	when I press the friend button next to a user's name, 
	it should change to pending and notify them to confirm
	
	Background:
	  Given I have an account
      And I am on "the home page"
      And I fill in "Email" with "foobar@example.com"
      And I fill in "Password" with "testing"
      And I press "Sign in"
      Then I am on "the home page"

	Scenario:
		When I fill in "Search People" with "bar"
		And I press "enter"
		Then I should see "Foo Bar"
		When I press "Request Friend"
		Then I should see "pending"
