class ProjectsController < ApplicationController
  before_action :require_login
  before_action :require_resource_ownership, only: [:edit, :update, :destroy]
  before_action :initialize_project
  def index
    @projects = Project.all
  end

  def new
    initialize_texts
  end

  def create
    @project = current_researcher.projects.build(project_params)
    #move below method back into the action
    attempt_save_project
  end

  def show
  end

  def edit
    
    initialize_texts
  end

  def update
    @project.update(project_params)
    #refactor this, if project.update
    attempt_save_project
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def search
    @projects = Project.search(params[:search])
    render :index
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
      initialize_texts
      params[:id]? (render :edit) : (render :new)
    end
  end
end