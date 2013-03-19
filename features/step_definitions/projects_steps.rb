Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I navigate to the new project creation page$/) do
  click_link('Create new Project')
end

When(/^I create a new project$/) do
  fill_in('name', :with => 'my new project')
  click_button('submit')
end

Then(/^I should be shown the project created verification message$/) do
  pending # express the regexp above with the code you wish you had
end
