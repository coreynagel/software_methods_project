#encoding: utf-8

Feature: User Login
	on the main page
	As a user
	logging in should take me to the home page

	Background:
		Given I have an account

	Scenario:
		When I am on "the home page"
		And I fill in "Email" with "foobar@example.com"
		And I fill in "Password" with "testing"
		And I press "Sign in"
		Then I am on "the home page"
		And I should see "Welcome Foo Bar"
