Given /^I am on the (.+)$/ do |page_name|
  visit root_path
end

When /^I create a project called "(.+)"$/ do |project_name|
  click_link "New Project"
  fill_in "Name", :with => project_name
  click_button "Create Project"
end

Then /^I should see the message "(.+)"$/ do |message|
  page.should have_selector("div", :content => message)
end

Then /^I should be on the project page for "(.+)"$/ do |project_name|
  visit project_path(Project.find_by_name!(project_name))
end

Then /^I should see "(.+)"$/ do |page_title|
  page.should have_content(page_title)
end
