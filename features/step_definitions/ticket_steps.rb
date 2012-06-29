#Arrangements

Given /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end

#Actions

When /^I want to add ticket to that project$/ do
  click_link "New Ticket"
end

When /^I add the ticket "(.+)" with description "(.+)"$/ do |title, description|
  fill_in "Title", :with => title
  fill_in "Description", :with => description
  click_button "Create Ticket"
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
