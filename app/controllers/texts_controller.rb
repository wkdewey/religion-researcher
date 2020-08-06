class TextsController < ApplicationController

  def index
    @texts = Text.all
  end

  def show
    @text = Text.find_by(id: params[:id])
  end
end