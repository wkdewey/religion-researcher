class TextsController < ApplicationController

  def index
    @texts = Text.all
  end

  def new
    @text = Text.new
    @authors = Author.all
  end

  def create
    @text = Text.create(text_params)
    redirect_to text_path(@text)
  end

  def show
    @text = Text.find_by(id: params[:id])
  end

  private

  def text_params
    params.require(:text).permit(:title, :subject, :author_id)
  end
end