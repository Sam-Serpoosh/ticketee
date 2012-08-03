#Actions
When /^I add "(.*)" comment$/ do |comment|
  fill_in "Text", :with => comment
  click_button "Create Comment"
end


#Expectations
Then /^I should see "(.+)" comment$/ do |comment|
  page.should have_selector("#comments", :content => comment)
end
