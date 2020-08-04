class SessionsController < ApplicationController

  def new
  end

  def create
    @researcher = Researcher.find_by(name: researcher_params[:name])
    if @researcher && @researcher.authenticate(researcher_params[:password])
      sessions[:researcher_id] = @researcher.id
      redirect_to @researcher
    else
      redirect_to '/login'
    end
  end

end