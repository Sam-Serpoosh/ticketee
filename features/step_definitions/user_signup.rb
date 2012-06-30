#Arrangements

Given /^there are following users:$/ do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete("unconfirmed") == "true"
    @user = User.create!(attributes)
    @user.confirm! unless unconfirmed
  end
end

Given /^I am signed in as them$/ do
  steps(%Q{
    Given I am on the homepage
    When I sign in
    Then I should see the message "Signed in successfully."
  })
end

#Actions

When /^I sign up$/ do
  click_link "Sign up"
  fill_in "Email", :with => "user@ticketee.com"
  fill_in "Password", :with => "password"
  fill_in "Password confirmation", :with => "password"
  click_button "Sign up"
end

When /^I sign in$/ do
  click_link "Sign in"
  fill_in "Email", :with => "user@ticketee.com"
  fill_in "Password", :with => "password"
  click_button "Sign in"
end
