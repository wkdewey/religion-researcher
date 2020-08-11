class NotesController < ApplicationController

  before_action :require_login
  def index
    @notes = Note.all
      
  end

  def written
    @notes = Note.written
    render :index
  end

  def new
    @note = Note.new
    @projects = current_researcher.projects
    @texts = Text.all
  end


end