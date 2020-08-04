class SessionsController < ApplicationController

  def new
  end

  def create
    @researcher = Researcher.find_by(name: researcher_params[:name])
    byebug
    if @researcher && @researcher.authenticate(researcher_params[:password])
      login_researcher(@researcher)
      redirect_to @researcher
    else
      redirect_to '/login'
    end
  end

  def researcher_params
    params.permit(:name, :email, :institution, :password, :authenticity_token)
  end

end