class ReligiousTradition < ApplicationRecord
  has_many :texts
  validates :name, presence: true, uniqueness: true

end
