class TextsController < ApplicationController

  def index
    @texts = Text.all
  end

  def new
    @text = Text.new
    @authors = Author.all
  end

  def show
    @text = Text.find_by(id: params[:id])
  end
end