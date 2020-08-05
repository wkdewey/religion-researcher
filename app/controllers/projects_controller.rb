class ProjectsController < ApplicationController

  def show
    @project = Project.find_by(id: params[:id])
  end

  def edit
    @project = Project.find_by(id: params[:id])
    @texts = Text.all
  end

end