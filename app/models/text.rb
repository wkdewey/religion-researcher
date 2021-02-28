class Text < ApplicationRecord
  has_many :notes
  belongs_to :author
  belongs_to :religious_tradition
  has_many :projects, through: :notes
  validates :title, presence: true, uniqueness: true
  accepts_nested_attributes_for :author
  accepts_nested_attributes_for :religious_tradition
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
 


  def religious_tradition_attributes=(religious_tradition)
    if religious_tradition[:name].empty?
      self.religious_tradition = ReligiousTradition.find_by(id: religious_tradition[:id])
    else
      self.create_religious_tradition(name: religious_tradition[:name])
    end
  end



  def note(project)
    notes.where(project_id: project.id).first
  end
  
end
