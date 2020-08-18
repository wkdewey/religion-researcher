class Project < ApplicationRecord
  belongs_to :researcher
  has_many :notes
  has_many :texts, through: :notes
  has_many :authors, through: :texts
  validates :title, presence: true, uniqueness: true

  before_destroy :destroy_notes
  
  def destroy_notes
    self.notes.destroy_all
  end

end
