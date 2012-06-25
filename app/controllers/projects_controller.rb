class ProjectsController < ApplicationController

  def index
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end
  
  def create
    @project = Project.create!(params[:project])
    flash[:notice] = "Project has been created."
    redirect_to @project
  end

end
