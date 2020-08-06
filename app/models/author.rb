class Author < ApplicationRecord
  has_many :texts
  belongs_to :religious_tradition
  validates :name, presence: true
  accepts_nested_attributes_for :religious_tradition
end
