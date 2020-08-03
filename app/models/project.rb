class Project < ApplicationRecord
  belongs_to :researcher
  has_many :notes
  has_many :texts, through: :notes
end
