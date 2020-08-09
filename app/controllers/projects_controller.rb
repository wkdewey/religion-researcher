class ProjectsController < ApplicationController

  def index
    if logged_in?
      @projects = Project.all
    else
      login_error
    end
  end

  def new
    @project = Project.new
    @texts = Text.all
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
    @project = Project.find_by(id: params[:id])
  end

  def edit
    @project = Project.find_by(id: params[:id])
    @texts = Text.all
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