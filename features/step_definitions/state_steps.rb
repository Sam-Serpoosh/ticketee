#setups
Given /^there is a state called "(.+)"$/ do |state|
  State.create!(:name => state)
end

#Expectations
Then /^I should see state "(.+)"$/ do |state|
  page.should have_css("#comment_state_id", :text => state)
end
