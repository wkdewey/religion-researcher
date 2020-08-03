class CreateResearchers < ActiveRecord::Migration[6.0]
  def change
    create_table :researchers do |t|
      t.string :name
      t.string :email
      t.string :institution

      t.timestamps
    end
  end
end
