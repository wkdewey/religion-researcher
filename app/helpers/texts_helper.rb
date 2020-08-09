module TextsHelper
  def author_id_field(song)
    if song.author.nil?
      select_tag "text[author_id]", options_from_collection_for_select(Author.all, :id, :name)
    else
      hidden_field_tag "text[author_id]", song.artist_id
    end
  end
end