class ApplicationController < ActionController::Base

  def welcome
    
  end

  def login_researcher(researcher)
    session[:researcher_id] = researcher.id
  end

  def require_login
    return head(:forbidden) unless logged_in?
  end
end