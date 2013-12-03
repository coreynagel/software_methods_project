#encoding: utf-8

Feature:User Wall Post
	as a user, if there is a post on my wall, the post should contain the authors name as a hyperlink to their profile

	Background:
		Given I have an account
		And I visit my user page
		And foobar has a micropost
	Scenario:
		
