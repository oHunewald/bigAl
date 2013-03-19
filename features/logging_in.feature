Feature: Logging in
In order to be able to create new projects
As a user
I have to login

Scenario: Loggin in
	Given there are the following users:
	|name	| email				| password |
	|hugo	| user@bigal.com	| password |
	And I am on the homepage
	When I sign in
	Then I should be shown create new project link