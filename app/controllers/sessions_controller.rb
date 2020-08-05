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

  def create_omniauth
    @researcher = Researcher.find_or_create_from_auth_hash(auth_hash)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def find_or_create_from_auth_hash
    byebug
  end

  def researcher_params
    params.permit(:name, :email, :institution, :password, :authenticity_token)

  end

  def auth_hash
    request.env['omniauth.auth']
  end


end