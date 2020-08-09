class ApplicationController < ActionController::Base

  def welcome
    
  end

  def login_researcher(researcher)
    session[:researcher_id] = researcher.id
  end

  def current_researcher
    @current_researcher ||= Researcher.find_by(id: session[:researcher_id])
  end

  def logged_in?
    !!session[:researcher_id]
  end

  def login_error
    flash[:error] = "You must log in to see that page"
    redirect "/login"
  end
end
