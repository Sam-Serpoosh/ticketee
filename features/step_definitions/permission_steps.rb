permission_step = /^"(.+)" can "(.+)" (in)?\s?the "(.+)" project$/

Given permission_step do |user, permission, on, project|
  create_permission(user, project, permission)
end

def create_permission(user_email, project_name, action)
  Permission.create!(:user => User.find_by_email!(user_email),
                     :thing => Project.find_by_name!(project_name),
                     :action => action)
end
