Given /^I am on the (.+)$/ do |page_name|
  visit root_path
end

When /^I follow "(.+)"$/ do |link|
  click_link link
end

When /^I fill in "(.+)" with "(.+)"$/ do |field_name, field_value|
  fill_in field_name, :with => field_value
end

When /^I press "(.+)"$/ do |button|
  click_button button
end

Then /^I should see "(.+)"$/ do |message|
  page.should have_selector("div", :content => message)
end
