class TextsController < ApplicationController
  before_action :require_login
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
      @text = Text.new(project_ids: [params[:project_id]])
      @authors = Author.all
      @religious_tradition = ReligiousTradition.all
    end
  end

  def create
    @text = Text.new(text_params)
    
    if @text.save
      redirect_to text_path(@text)
    else
      @authors = Author.all
      @religious_tradition = ReligiousTradition.all
      render :new
    end
  end

  
  
  def edit
    if params[:project_id]
      project = Project.find_by(id: params[:project_id])
      if project.nil?
        redirect_to projects_path, alert: "Project not found."
      else
        @project = params[:project_id].to_i
        @text = project.texts.find_by(id: params[:id])
        @authors = Author.all
        @religious_tradition = ReligiousTradition.all
        redirect_to project_texts_path(project) if @text.nil?
      end
    else
      @text = Text.find_by(id: params[:id])
      @authors = Author.all
      @religious_tradition = ReligiousTradition.all
    end
  end

  def update
    @text = Text.find_by(id: params[:id])
    @text.update(text_params)
    if @text.save
      redirect_to text_path(@text)
    else
      @authors = Author.all
      @religious_tradition = ReligiousTradition.all
      render :edit
    end
  end

  def destroy
    @text = Text.find(params[:id])
    @text.destroy
    flash[:notice] = "Text deleted."
    redirect_to texts_path
  end


  private

  def text_params
    params.require(:text).permit(:title,
      :subject, 
      :author_id, 
      project_ids: [],
      author_attributes: [
        :name,
        :religious_tradition_id,
        religious_tradition_attributes: [
          :name,
          :id
        ]
      ],
      notes_attributes: [ :content, :id ]
    )
  end
end