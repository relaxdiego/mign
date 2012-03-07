class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :back, :alert => "You are not allowed to do that"
  end
end
