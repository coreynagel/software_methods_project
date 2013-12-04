#encoding utf-8

Feature: Add Friend From Search
	as a user, 
	on the search results page, 
	when I press the friend button next to a user's name, 
	it should change to pending and notify them to confirm
	
	Background:
		Given I have an account

	Scenario:
		When I fill in input with bar
		And I press enter
		Then I should see FooBar
		When I click friend
		Then I should should see pending
