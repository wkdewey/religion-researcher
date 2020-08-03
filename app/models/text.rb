class Text < ApplicationRecord
  has_many :notes
  has_many :projects, through: :notes
end
