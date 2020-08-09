module TextsHelper
  def author_id_field(text)
    if text.author_id.nil?
      select_tag "text[author_id]", options_from_collection_for_select(Author.all, :id, :name)
    else
      hidden_field_tag "text[author_id]", text.author_id
    end
  end
end