

Feature: Visitor Create Account
	create an account
	As a visitor
	Should take me to the home page creation

	Scenario:
		Given I am on "the home page"
		When I click "Join us!"
		And I fill in "First name" with "Foo"
		And I fill in "Last name" with "Bar"
		And I fill in "Email" with "foobar@example.com"
		And I fill in "Password" with "testing"
		And I fill in "Confirmation" with "testing"
		And I press "Create my account"
		Then I am on "the home page"
		And I should see "Welcome Foo Bar"

	