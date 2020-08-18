class Note < ApplicationRecord
  belongs_to :project
  belongs_to :text
  scope :written, -> { where.not(content: nil) }
  validates :text_id, uniqueness: {scope: :project_id}

  def belongs_to?(project)
    self.project_id == project.id
  end
end
