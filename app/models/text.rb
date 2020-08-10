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
  
  if author[:name].empty?
    self.author = Author.find_by(id: author[:id])
  else
    author.delete("id")
    self.create_author(author)
  end
 end

 def get_note(project)
  notes.where(project_id: project.id).first.content
 end
  
end
