require 'spec_helper'

describe TicketsController do
  let(:user) { create_user! }
  let(:project) { Factory(:project) }
  let(:ticket) { Factory(:ticket, :project => project,
                                  :user => user) }
  
  describe "access control" do
    it "can't see tickets when doesn't have permission" do
      sign_in(:user, user)
      get :show, :id => ticket.id, :project_id => project.id
      response.should redirect_to(root_path)
      flash[:alert].should =~ /could not be found./
    end
  end

end
