class AddAuthorIdToTexts < ActiveRecord::Migration[6.0]
  def change
    add_reference :texts, :author, null: false, foreign_key: true
  end
end
