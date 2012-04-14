class RootController < ApplicationController
  # This path will eventually become the main entry point for
  # all types of clients including REST clients.
  def index
    if user_signed_in?
      redirect_to workspaces_url
    else
      redirect_to new_user_session_url
    end
  end
end
