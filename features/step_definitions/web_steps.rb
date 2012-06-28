#Arrangements

Given /^I am on the (.+)$/ do |page_name|
  visit root_path
end

#Expectations

Then /^I should see the message "(.+)"$/ do |message|
  page.should have_content(message) 
end

Then /^I should see "(.+)"$/ do |content|
  page.should have_content(content)
end

Then /^I should not see "(.+)" anymore$/ do |project_name|
  response.should_not have_selector("a", :content => project_name)
end
