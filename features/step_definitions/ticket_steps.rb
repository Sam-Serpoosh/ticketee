#Arrangements

Given /^"(.+)" has created a ticket for this project:$/ do |user_email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(:user => User.find_by_email!(user_email))
    @project.tickets.create!(attributes)
  end
end

#Actions

When /^I want to add ticket to "(.+)" project$/ do |project_name|
  click_link project_name
  click_link "New Ticket"
end

When /^I add the ticket "(.+)" with description "(.+)"$/ do |title, description|
  steps(%Q{When Ticket information "#{title}" and "#{description}" was filled})
  click_button "Create Ticket"
end

When /^I add a ticket with "(.+)" and "(.+)" and I attach files$/ do |title, description|
  steps(%Q{When Ticket information "#{title}" and "#{description}" was filled})
  attach_file("File #1", "spec/fixtures/speed.txt")
  click_link "Add another file"
  attach_file("File #2", "spec/fixtures/spin.txt")
  click_link "Add another file"
  attach_file("File #3", "spec/fixtures/gradient.txt")
  click_button "Create Ticket"
end

When /^Ticket information "(.+)" and "(.+)" was filled$/ do |title, description|
  fill_in "Title", :with => title
  fill_in "Description", :with => description 
end

When /^I add a ticket with no name and description$/ do
  click_button "Create Ticket"
end

When /^I go to "(.+)" ticket$/ do |ticket|
  click_link ticket
end

When /^I edit the ticket to "(.*)"$/ do |new_title|
  click_link "Edit Ticket"
  fill_in "Title", :with => new_title
  click_button "Update Ticket"
end

When /^I delete the ticket$/ do
  click_link "Delete Ticket"
end

When /^I go to "(.+)" file$/ do |file_name|
  click_link file_name
end

#Expectations

Then /^I should see ticket "(.+)"$/ do |ticket_title|
  page.should have_content(ticket_title) 
end

Then /^I should not see ticket "(.+)"$/ do |ticket_title|
  page.should_not have_content(ticket_title)
end

Then /^I should see description "(.+)"$/ do |description|
  page.should have_content(description)
end

Then /^I should see title "(.+)"$/ do |ticket_title|
  page.should have_selector("#ticket h2", :content => ticket_title)
end

Then /^I should see "(.+)" for the ticket$/ do |file_name|
  page.should have_selector("#ticket .assets", :content => file_name)
end
