class Author < ApplicationRecord
  has_many :texts
  belongs_to :religious_tradition
  validates :name, presence: true
end
