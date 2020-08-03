class CreateReligiousTraditions < ActiveRecord::Migration[6.0]
  def change
    create_table :religious_traditions do |t|
      t.string :name

      t.timestamps
    end
  end
end
