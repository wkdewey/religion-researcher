class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :project_id
      t.integer :text_id
      t.string :content

      t.timestamps
    end
  end
end
