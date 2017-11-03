class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  before_action :confirm_logged_in,
  	:except => [:new, :create, :login, :attempt_login, :logout]

  def confirm_logged_in
  	if !logged_in?
  		redirect_to root_url
  		return false
  	else 
  		return true
  	end
  end

end
