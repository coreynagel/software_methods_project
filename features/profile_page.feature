#encoding: utf-8

Feature: Profile Page
	If user is on their own profile page, their user info and wall will be displayed
	If a user is on a friend's profile page, they will see that user's info and wall displayed
	User should have ability to write a post
	If a user is on someone who is not a friend, the user will see the user's name and a 'send friend request' button

Background:
  Given I have an account
  And I am on "the home page"
  And I fill in "Email" with "foobar@example.com"
  And I fill in "Password" with "testing"
  And I press "Sign in"


  Scenario: User is on own profile page
	Given I am on my profile page
	Then I should see the following user information: hometown, birthday, school, job, quotes, movies, music, books
	And I should see "posts" on my wall

  Scenario: User is on friend's profile page
	Given I am on my friend's profile page
	Then I should see the following user information: hometown, birthday, school, job, quotes, movies, music, books
	And I should see "posts" on their wall

  Scenario: Mutual friends on friend's profile page
    Given I am on my friend's profile page
    Then I should see "Mutual Friends"

  Scenario: User should have ability to write a post
	Given I am on  "profile" page
	When I fill in "content" with "my new post"
	And I press "post"
	Then I should see "my new post"

  Scenario: User is not friend of current profile page
	Given I am not a friend of someone
	And I am on their "profile" page
	Then I should see a "send friend request" button

