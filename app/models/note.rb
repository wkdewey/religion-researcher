class Note < ApplicationRecord
  belongs_to :project
  belongs_to :text
  scope :written, -> { where.not(content: nil) }
  scope :blank, -> { where(content: nil) }

  def belongs_to?(project)
    self.project_id == project.id
  end
end
