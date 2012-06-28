require 'spec_helper'

describe Project do

  describe "vlaidations" do
    it "is not valid without a name" do
      no_name_project = Project.new
      no_name_project.should_not be_valid
    end

    it "is valid with a name" do
      project = Project.new(:name => "test")
      project.should be_valid
    end
  end

  describe "destroy associated tickets" do
    it "deletes associated tickets after deleting the project" do
      project = Factory(:project)
      ticket = Factory(:ticket, :project => project)
      project.destroy
      Ticket.count.should == 0
    end
  end

end
