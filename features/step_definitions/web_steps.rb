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
  page.should_not have_link(project_name)
end
