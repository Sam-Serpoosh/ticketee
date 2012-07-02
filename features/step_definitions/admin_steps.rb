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
