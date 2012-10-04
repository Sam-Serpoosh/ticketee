#setups
Given /^there is a state called "(.+)"$/ do |state|
  State.create!(:name => state)
end

#Expectations
Then /^I should see state "(.+)"$/ do |state|
  page.should have_css("#comment_state_id", :text => state)
end

Then /^I should see "(.+)" state for ticket$/ do |state|
  page.should have_css("#ticket .state", :text => state)
end

Then /^I should see "(.+)" for the comment$/ do |state| 
  page.should have_css("#comments", :text => state)
end
