class CommentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def create
    @comment.author = current_user
    @comment.save
    redirect_to ticket_path(@comment.ticket.id)
  end
end
