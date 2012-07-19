class TicketsController < ApplicationController
  before_filter :authenticate_user! 
  before_filter :find_project
  before_filter :find_ticket_of_project, :only => [:show, :edit, :update, :destroy]
  before_filter :authorize_create!, :only => [:new, :create]
  before_filter :authorize_update!, :only => [:edit, :update]
  before_filter :authorize_delete!, :only => [:destroy]

  def show
  end

  def new
    @ticket = @project.tickets.build
    @ticket.assets.build
  end

  def create
    @ticket = @project.tickets.build(params[:ticket].merge!(:user => current_user))
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to project_ticket_path(@project, @ticket)
    else
      flash[:alert] = "Ticket has not been created."
      render :action => "new"
    end
  end
  
  def edit
  end

  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Ticket has been updated."
      redirect_to project_ticket_path(@project, @ticket)
    else
      flash[:alert] = "Ticket has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted."
    redirect_to project_path(@project)
  end

  private
    
    def find_project
      begin
        @project = Project.for(current_user).find(params[:project_id])
      rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The project you were looking for could not be found."
        redirect_to root_path
      end
    end

    def find_ticket_of_project
      @ticket = @project.tickets.find(params[:id])
    end

    def authorize_create!
      set_ability
      check_authorization("create tickets", "You can not create tickets on this project.")
    end

    def authorize_update!
      check_authorization("edit tickets", "You can not edit tickets on this project")
    end
    
    def authorize_delete!
      check_authorization("delete tickets", "You can not delete tickets from this project.")
    end

    def set_ability
      @current_ability ||= ::Ability.new(current_user)
    end

    def check_authorization(action, alert_message)
      if !current_user.admin? && cannot?(action.to_sym, @project)
        flash[:alert] = alert_message
        redirect_to project_path(@project)
      end
    end

end
