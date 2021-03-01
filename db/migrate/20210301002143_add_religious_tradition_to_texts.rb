class AddReligiousTraditionToTexts < ActiveRecord::Migration[6.0]
  def change
    add_reference :texts, :religious_tradition, null: false, foreign_key: true
  end
end
