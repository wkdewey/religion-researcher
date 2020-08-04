class Project < ApplicationRecord
  belongs_to :researcher
  has_many :notes
  has_many :texts, through: :notes
  has_many :authors, through: :texts
  validates :title, presence: true
end
