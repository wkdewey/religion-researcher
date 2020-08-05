class ApplicationController < ActionController::Base

  def welcome
    
  end

  def login_researcher(researcher)
    session[:researcher_id] = researcher.id
  end
end
