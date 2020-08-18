class SessionsController < ApplicationController

  def new
  end

  def create
    @researcher = Researcher.find_by(name: researcher_params[:name])
    if @researcher && @researcher.authenticate(researcher_params[:password])
      login_researcher(@researcher)
    else
      flash[:errors] = "Invalid credentials"
      redirect_to '/login'
    end
  end

  def create_omniauth
    @researcher = Researcher.find_by(name: auth_hash[:info][:name])
    if @researcher
      login_researcher(@researcher)
    else
      flash[:errors] = "Invalid credentials"
      redirect_to '/login'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private


  def researcher_params
    params.permit(:name, :email, :institution, :password, :authenticity_token)

  end

  def auth_hash
    request.env['omniauth.auth']
  end


end