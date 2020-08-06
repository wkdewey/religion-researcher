class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @texts = Text.all
  end

  def create
    @project = current_researcher.projects.create(project_params)
    byebug
    redirect_to project_path(@project)
  end

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

  def destroy
    @project = Project.find_by(id: params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def project_params
    params.require(:project).permit(:title, :description, :text_ids =>[])
  end

end