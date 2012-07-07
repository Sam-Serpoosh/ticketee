#Arrangements

Given /^I am on the (.+)$/ do |page_name|
  visit root_path
end

#Actions

When /^I check the "(.+)"$/ do |check_box|
  check check_box
end

#Expectations

Then /^I should see the message "(.+)"$/ do |message|
  page.should have_content(message) 
end

Then /^I should see "(.+)"$/ do |content|
  page.should have_content(content)
end

Then /^I should not see "(.+)"$/ do |content|
  page.should_not have_content(content)
end

Then /^I should not see "(.+)" anymore$/ do |project_name|
  page.should_not have_link(project_name)
end

Then /^I should see "(.+)" link$/ do |link_text|
  page.should have_css("a", :text => link_text)
end

Then /^I should not see "(.+)" link$/ do |link_text|
  page.should_not have_css("a", :text => link_text)
end
