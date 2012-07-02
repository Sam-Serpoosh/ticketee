When /^I want to create new users$/ do
  click_link "Admin"
  click_link "Users"
  click_link "New User"
end

When /^I create a new user$/ do 
  fill_in "Email", :with => "newbie@ticketee.com"
  fill_in "Password", :with => "password"
  click_button "Create User"
end 

When /^I create a new user with no email$/ do
  fill_in "Password", :with => "password"
  click_button "Create User"
end

When /^I create an admin user$/ do 
   fill_in "Email", :with => "newadmin@ticketee.com"
   fill_in "Password", :with => "password"
   check "Is an admin?"
   click_button "Create User"
end


When /^I want to edit the user "(.+)"$/ do |user_email|
  click_link "Admin"
  click_link "Users"
  click_link user_email
  click_link "Edit User"
end

When /^I update user with "(.*)"$/ do |new_email|
  fill_in "Email", :with => new_email
  click_button "Update User"
end

When /^I make a user admin$/ do
  check "Is an admin?"
  click_button "Update User"
end

When /^I want to delete a user$/ do
  click_link "Admin"
  click_link "Users"
end

When /^I delete "(.+)"$/ do |user_email|
  click_link user_email
  click_link "Delete User"
end
