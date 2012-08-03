class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]
  before_filter :find_ticket, :only => [:create]

  def create
    @comment = build_comment 
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to project_ticket_path(@ticket.project, @ticket)
    else
      flash[:error] = "Comment has not been created."
      render :template => "tickets/show"
    end
  end

  private
    def find_ticket
      @ticket = Ticket.find(params[:ticket_id])
    end

    def build_comment
      @ticket.comments.build(params[:comment].
                             merge!(:user => current_user))
    end
end
