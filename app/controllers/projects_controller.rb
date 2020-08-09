class ProjectsController < ApplicationController
  before_action :require_login
  def index
    if logged_in?
      @projects = Project.all
    else
      login_error
    end
  end

  def new
    if logged_in?
      @project = Project.new
      @texts = Text.all
    else
      login_error
    end
  end

  def create
    @project = current_researcher.projects.build(project_params)
    
    if @project.save
      redirect_to project_path(@project)
    else
      @texts = Text.all
      render :new
    end
  end

  def show
    if logged_in?
      @project = Project.find_by(id: params[:id])
    else
      login_error
    end
  end

  def edit
    
    @project = Project.find_by(id: params[:id])
    @texts = Text.all
    if !logged_in?
      login_error
    end
  end

  def update
    @project = Project.find_by(id: params[:id])
    @project.update(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      @texts = Text.all
      render :edit
    end
  end

  def destroy
    @project = Project.find_by(id: params[:id])
    @project.notes.each do |note|
      note.destroy
    end
    @project.destroy
    redirect_to projects_path
  end

  def project_params
    params.require(:project).permit(:title, :description, :text_ids =>[])
  end

end