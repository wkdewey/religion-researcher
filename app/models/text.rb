class Text < ApplicationRecord
  has_many :notes
  belongs_to :author
  has_many :projects, through: :notes
  validates :title, presence: true
  accepts_nested_attributes_for :author
  accepts_nested_attributes_for :notes

  # def author_name
  #   self.try(:author).try(:name)
  # end

  # def author_name=(name)
  #   author = Author.find_or_create_by(name: name)
  #   self.author = author
  # end
 def author_attributes=(author)
  self.author = Author.find_or_create_by(id: author[:id])
  self.author.update(author)
  byebug
 end
  
end
