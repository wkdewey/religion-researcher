class Author < ApplicationRecord
  has_many :texts
  belongs_to :religious_tradition
end
