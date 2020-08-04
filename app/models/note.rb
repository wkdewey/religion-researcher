class Note < ApplicationRecord
  belongs_to :project
  belongs_to :text
  scope :written, -> where { content }
  scope :blank, -> where { content:nil }
end
