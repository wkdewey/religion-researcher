class ReligiousTradition < ApplicationRecord
  has_many :authors
  has_many :texts, through: :authors
  validates :name, presence: true
end
