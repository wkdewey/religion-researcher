class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def written
    @notes = Note.written
    render :index
  end


end