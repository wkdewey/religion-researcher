module NotesHelper
  def project_id_field(note)
    if note.project_id.nil?
      (label_tag "note[project_id]", "Choose one of your projects") +\
      (select_tag "note[project_id]", options_from_collection_for_select(current_researcher.projects, :id, :title))
    else
      hidden_field_tag "note[project_id]", note.project_id
    end
  end
end