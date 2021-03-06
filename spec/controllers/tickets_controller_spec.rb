require 'spec_helper'

describe TicketsController do
  let(:user) { create_user! }
  let(:project) { Factory(:project) }
  let(:ticket) { Factory(:ticket, :project => project,
                                  :user => user) }
  
  describe "viewing tickets access control" do

    it "can't see tickets when doesn't have permission" do
      sign_in(:user, user)
      get :show, :id => ticket.id, :project_id => project.id
      response.should redirect_to(root_path)
      flash[:alert].should =~ /could not be found./
    end

  end

  describe "creating tickets access control" do

    before do
      sign_in(:user, user)
      Permission.create!(:user => user, :thing => project, 
                         :action => "view")
    end

    it "can't start creation of ticket" do
      get :new, :project_id => project.id
      cannot_create_tickets!
    end 

    it "can't create a ticket" do
      post :create, { :project_id => project.id, :ticket => {} }
      cannot_create_tickets!
    end

    def cannot_create_tickets!
      response.should redirect_to(project_path(project))
      flash[:alert].should =~ /can not create tickets on this project./
    end
  
  end

  describe "updating tickets access control" do

    before do
      sign_in(:user, user)
      Permission.create!(:user => user,
                         :thing => project,
                         :action => "view")
    end

    it "can't start editing ticket" do
      get :edit, { :project_id => project.id, :id => ticket.id }
      cannot_update_tickets!
    end

    it "can't update a ticket" do
      put :update, { :project_id => project.id, 
                     :id => ticket.id,
                     :ticket => {} }
      cannot_update_tickets!
    end

    def cannot_update_tickets!
      response.should redirect_to(project_path(project))
      flash[:alert].should =~ /can not edit tickets on this project/
    end

  end

  describe "deleting tickets access control" do
    
    before do
      sign_in(:user, user)
      Permission.create!(:user => user,
                        :thing => project,
                        :action => "view")
    end

    it "can't delete tickets without permission" do
      delete :destroy, { :project_id => project.id, :id => ticket.id }
      flash[:alert].should =~ /can not delete tickets from this project./
      response.should redirect_to(project_path(project))
    end

  end

end
