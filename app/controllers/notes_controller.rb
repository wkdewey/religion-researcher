class NotesController < ApplicationController

  before_action :require_login
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