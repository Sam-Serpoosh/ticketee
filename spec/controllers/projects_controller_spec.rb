require 'spec_helper'

describe ProjectsController do

  describe "accessing a no-longer existed project" do
    it "redirects to index page and show and alert message" do
      get :show, :id => "not-existed"
      flash[:alert].should =~ /could not be found/
      response.should redirect_to(projects_path)
    end
  end

end
