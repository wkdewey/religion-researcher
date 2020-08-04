class ApplicationController < ActionController::Base

  def researcher_params
    params.require(:researcher).permit(:name, :email, :institution, :password)
  end

  def login_researcher(researcher)
    session[:researcher_id] = researcher.id
  end
end
