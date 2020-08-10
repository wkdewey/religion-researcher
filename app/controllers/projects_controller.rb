class ProjectsController < ApplicationController
  before_action :require_login
  def index
    @projects = Project.all
  end

  def new
    initialize_project
    initialize_texts
  end

  def create
    @project = current_researcher.projects.build(project_params)
    attempt_save_project
  end

  def show
    initialize_project
  end

  def edit
    
    initialize_project
    initialize_texts
  end

  def update
    initialize_project
    @project.update(project_params)
    attempt_save_project
  end

  def destroy
    initialize_project
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :text_ids =>[])
  end

  def initialize_project
    @project = Project.find_by(id: params[:id]) || Project.new
  end

  def initialize_texts
    @texts = Text.all
  end


  def attempt_save_project
    if @project.save
      redirect_to project_path(@project)
    else
      @texts = Text.all
      render :edit
    end
  end
end