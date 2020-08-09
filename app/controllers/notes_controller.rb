class NotesController < ApplicationController

  before_action :require_login
  def index
    @notes = Note.all
      
  end

  def written
    @notes = Note.written
    render :index
  end


end