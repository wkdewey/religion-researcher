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

  def new
    @text = Text.new
    @authors = Author.all
    @religious_tradition = ReligiousTradition.all
  end

  def create
    @text = Text.create(text_params)
    redirect_to text_path(@text)
  end

  def show
    @text = Text.find_by(id: params[:id])
  end
  
  def edit
    @text = Text.find_by(id: params[:id])
    @authors = Author.all
    @religious_tradition = ReligiousTradition.all
  end

  def update
    @text = Text.find_by(id: params[:id])
    @text.update(text_params)
    redirect_to text_path(@text)
  end


  private

  def text_params
    params.require(:text).permit(:title, :subject, :author_id)
  end
end