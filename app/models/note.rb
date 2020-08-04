class Note < ApplicationRecord
  belongs_to :project
  belongs_to :text
  scope :written, -> { where.not(content: nil) }
  scope :blank, -> { where(content: nil) }
end
