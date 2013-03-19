Given(/^there are the following users:$/) do |table|

	table.hashes.each do |hash|
		@user = User.create!(hash)
	end  
end


When(/^I sign in$/) do
  visit new_user_session_path
  fill_in "Email", :with => @user.email
  fill_in "Password", :with => @user.password
  click_button "Sign in"
end

Then(/^I should be shown create new project link$/) do
  page.should have_content("Create new Project")
end
