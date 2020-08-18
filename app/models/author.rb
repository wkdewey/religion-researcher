class Author < ApplicationRecord
  has_many :texts
  belongs_to :religious_tradition
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :religious_tradition


  def religious_tradition_attributes=(religious_tradition)
    if religious_tradition[:name].empty?
      self.religious_tradition = ReligiousTradition.find_by(id: religious_tradition[:id])
    else
      self.create_religious_tradition(name: religious_tradition[:name])
    end
  end
end
