#Arrangements

Given /^I am on the (.+)$/ do |page_name|
  visit root_path
end

Given /^there is a project called "(.+)"$/ do |project_name|
  Factory(:project, :name => project_name)
end

#Actions

When /^I go to "(.+)" page$/ do |project_link|
  click_link project_link
end

When /^I create a project called "(.+)"$/ do |project_name|
  click_link "New Project"
  fill_in "Name", :with => project_name
  click_button "Create Project"
end

When /^I edit the project "(.+)" to "(.*)"$/ do |old_name, new_name|
  click_link old_name
  click_link "Edit Project"
  fill_in "Name", :with => new_name
  click_button "Update Project"
end

When /^I create a project with no name$/ do
  click_link "New Project"
  click_button "Create Project"
end

When /^I delete project "(.+)"$/ do |project_name|
  click_link project_name
  click_link "Delete Project"
end


#Expectations

Then /^I should see the message "(.+)"$/ do |message|
  page.should have_content(message) 
end

Then /^I should be on the project page for "(.+)"$/ do |project_name|
  visit project_path(Project.find_by_name!(project_name))
end

Then /^I should see "(.+)"$/ do |content|
  page.should have_content(content)
end

Then /^I should not see "(.+)" anymore$/ do |project_name|
  response.should_not have_selector("a", :content => project_name)
end
