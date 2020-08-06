class TextsController < ApplicationController

  def index
    @texts = Text.all
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