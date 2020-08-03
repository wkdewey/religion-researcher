class AddReligiousTraditionIdToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_reference :authors, :religious_tradition, null: false, foreign_key: true
  end
end
