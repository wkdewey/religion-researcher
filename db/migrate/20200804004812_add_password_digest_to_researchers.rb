class AddPasswordDigestToResearchers < ActiveRecord::Migration[6.0]
  def change
    add_column :researchers, :password_digest, :string
  end
end
