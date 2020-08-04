class ApplicationController < ActionController::Base

  

  def login_researcher(researcher)
    session[:researcher_id] = researcher.id
  end
end
