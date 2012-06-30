require 'spec_helper'

describe ProjectsController do
  let (:user) do
    user = Factory(:user)
    user.confirm!
    user
  end

  let(:project) { Factory(:project) }
    
  describe "accessing a no-longer existed project" do
    it "redirects to index page and show an alert message" do
      get :show, :id => "not-existed"
      flash[:alert].should =~ /could not be found/
      response.should redirect_to(projects_path)
    end
  end

  context "normal users" do
    {
      "new" => "get",
      "create" => "post",
      "edit" => "get",
      "update" => "put",
      "destroy" => "delete"
    }.each do |action, method|
      it "can't create a new project" do
        sign_in(:user, user)
        send(method, action.dup, :id => project.id)
        response.should redirect_to(root_path)
        flash[:alert].should =~ /You must be admin/
      end
    end
  end

end
