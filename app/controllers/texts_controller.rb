class TextsController < ApplicationController
  before_action :require_login
  def index
    if params[:project_id]
      initialize_project
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
    initialize_text
  end

  def new
    if params[:project_id] && !Project.exists?(params[:project_id])
      redirect_to projects_path
    else
      @text = Text.new(project_ids: [params[:project_id]])
      @text.build_author
      @text.author.build_religious_tradition
      initialize_authors
    end
  end

  def create
    @text = Text.new(text_params)
    if @text.save
      redirect_to text_path(@text)
    else
      initialize_authors
      render :new
    end
  end
  
  def edit
    
      initialize_text
      initialize_authors
    
  end

  def update
    initialize_text
    @text.update(text_params)
    if @text.save
      redirect_to text_path(@text)
    else
      initialize_authors
      render :edit
    end
  end

  def destroy
    initialize_text
    @text.destroy
    flash[:notice] = "Text deleted."
    redirect_to texts_path
  end


  private

  def text_params
    params.require(:text).permit(:title,
      :subject,
      project_ids: [],
      author_attributes: [
        :id,
        :name,
        religious_tradition_attributes: [
          :id,
          :name
        ]
      ]
    )
  end

  def initialize_text
    @text = Text.find(params[:id])
  end

  def initialize_authors
    @authors = Author.all
    @religious_tradition = ReligiousTradition.all
    initialize_project if params[:project_id]
  end

  def initialize_project
    @project = Project.find_by(id: params[:project_id])
  end
end