#Arrangements

permission_step = /^"(.+)" can "(.+)" (in)?\s?the "(.+)" project$/

Given permission_step do |user, permission, on, project|
  create_permission(user, project, permission)
end

def create_permission(user_email, project_name, action)
  Permission.create!(:user => User.find_by_email!(user_email),
                     :thing => Project.find_by_name!(project_name),
                     :action => action)
end

#Actions

When /^I want to assign permissions to "(.+)"$/ do |user|
  visit root_path
  click_link "Admin"
  click_link "Users"
  click_link user 
  click_link "Permissions"
end

When /^I check "(.+)" for "(.+)"$/ do |action, project_name|
  project = Project.find_by_name!(project_name)
  permission = action.downcase.gsub(" ", "_")
  check_box_id = "permissions_#{project.id}_#{permission}"
  steps(%Q{When I check the "#{check_box_id}"})
  click_button "Update"
end
