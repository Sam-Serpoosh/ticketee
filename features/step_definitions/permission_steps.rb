Given /^"(.+)" can view the "(.+)" project$/ do |user_email, project_name|
  Permission.create!(:user => User.find_by_email!(user_email),
                     :thing => Project.find_by_name!(project_name),
                     :action => "view")
end
