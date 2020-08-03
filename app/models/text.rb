class Text < ApplicationRecord
  has_many :notes
  belongs_to :author
  has_many :projects, through: :notes
end
