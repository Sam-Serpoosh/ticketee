#Actions
When /^I add "(.*)" comment$/ do |comment|
  fill_in "Text", :with => comment
  click_button "Create Comment"
end

    
When /^I add "(.+)" comment with "(.+)" state$/ do |comment, state|
  fill_in "Text", :with => comment
  select(state, :from => "State")
  click_button "Create Comment"
end


#Expectations
Then /^I should see "(.+)" comment$/ do |comment|
  page.should have_css("#comments", :text => comment)
end
