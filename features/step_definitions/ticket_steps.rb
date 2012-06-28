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
