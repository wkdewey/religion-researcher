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

  def create
    @note = Note.create(note_params)
    byebug
    redirect_to project_path(@note.project_id)
  end

  private

  def note_params
    params.require(:note).permit(:project_id, :text_id, :content)
  end
end