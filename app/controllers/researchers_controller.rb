class ResearchersController < ApplicationController
  def new
    @researcher = Researcher.new
  end

  def create
    @researcher = Researcher.new(researcher_params)
    if @researcher.save
      login_researcher(@researcher)
      redirect_to @researcher
    else
      render :new
    end
  end

  def show
    @researcher = Researcher.find_by(id: params[:id])
  end


  private

  def researcher_params
    params.require(:researcher).permit(:name, :email, :institution, :password)
  end

  
end