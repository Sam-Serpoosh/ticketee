Then /^I should see state "(.+)"$/ do |state|
  page.should have_css("#comment_state_id", :text => state)
end
