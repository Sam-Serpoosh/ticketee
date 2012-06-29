#Arrangements

Given /^there are following users:$/ do |table|
  table.hashes.each do |attributes|
    @user = User.create!(attributes)
  end
end

#Actions

When /^I sign up$/ do
  click_link "Sign up"
  fill_in "Email", :with => "user@ticketee.com"
  fill_in "Password", :with => "password"
  fill_in "Password confirmation", :with => "password"
  click_button "Sign up"
end

