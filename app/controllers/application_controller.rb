class ApplicationController < ActionController::Base

  def welcome
    
  end

  def logged_in?
    !!session[:researcher_id]
  end

  def login_researcher(researcher)
    session[:researcher_id] = researcher.id
  end

  def current_researcher
    @current_researcher ||= Researcher.find_by(id: session[:researcher_id])
  end

  def require_login
    return head(:forbidden) unless logged_in?
  end
end