class TextsController < ApplicationController

  def index
    if params[:project_id]
      @project = Project.find_by(id: params[:project_id])
      if @project.nil?
        redirect_to projects_path
      else
        @texts = @project.texts
      end
    else
      @texts = Text.all
    end
  end

  def show
    if params[:project_id]
      @project = Project.find_by(id: params[:project_id])
      @text = @project.texts.find_by(id: params[:id])
      if @text.nil?
        redirect_to project_texts_path(@project)
      end
    else
      @text = Text.find(params[:id])
    end
    
  end

  def new
    if params[:project_id] && !Project.exists?(params[:project_id])
      redirect_to projects_path
    else
      @text = Text.new
      @authors = Author.all
      @religious_tradition = ReligiousTradition.all
    end
  end

  def create
    @text = Text.new(text_params)
    
    if @text.save
      redirect_to text_path(@text)
    else
      render :new
    end
  end

  
  
  def edit
    if params[:project_id]
      project = Project.find_by(id: params[:project_id])
      if project.nil?
        redirect_to projects_path, alert: "Project not found."
      else
        @text = project.texts.find_by(id: params[:id])
        @authors = Author.all
        @religious_tradition = ReligiousTradition.all
        redirect_to project_texts_path(project)
      end
    else
      @text = Text.find_by(id: params[:id])
      @authors = Author.all
      @religious_tradition = ReligiousTradition.all
  end

  def update
    @text = Text.find_by(id: params[:id])
    @text.update(text_params)
    if @text.save
      redirect_to @text
    else
      render :edit
    end
    redirect_to text_path(@text)
  end

  def destroy
    @text = Text.find(params[:id])
    @text.destroy
    flash[:notice] = "Text deleted."
    redirect_to texts_path
  end


  private

  def text_params
    params.require(:text).permit(:title, :subject, :author_id)
  end
end