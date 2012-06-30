require 'spec_helper'

describe Admin::UsersController do

  let(:user) { create_user! }

  context "normal users" do
    before do
      sign_in(:user, user)
    end

    it "is not able to access index action" do
      get :index
      response.should redirect_to(root_path)
      flash[:alert].should =~ /You must be admin/
    end
  end

end
