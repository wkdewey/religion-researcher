class NotesController < ApplicationController

  def index
    if logged_in?
      @notes = Note.all
    else
      login_error
    end
  end

  def written
    if logged_in?
      @notes = Note.written
      render :index
    else
      login_error
    end
  end


end