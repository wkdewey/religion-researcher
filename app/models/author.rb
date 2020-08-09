class Author < ApplicationRecord
  has_many :texts
  belongs_to :religious_tradition
  validates :name, presence: true
  accepts_nested_attributes_for :religious_tradition


  def religious_tradition_attributes=(religious_tradition)
    self.religious_tradition = ReligiousTradition.find_or_create_by(id: religious_tradition[:id])
    self.religious_tradition.update(religious_tradition)
    byebug
   end
end
