class ProjectsController < ApplicationController

  def show
    @project = Project.find_by(id: params[:id])
  end

  def edit
    @project = Project.find_by(id: params[:id])
    @texts = Text.all
  end

  def update
    @project = Project.find_by(id: params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def project_params
    params.require(:project).permit(:title, :description, :text_ids)
  end

end