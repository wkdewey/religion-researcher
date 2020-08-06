class Researcher < ApplicationRecord
  has_many :projects
  has_secure_password
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def self.find_or_create_from_auth_hash(auth_hash)
    researcher = self.find_or_create_by(email: auth_hash[:info][:email]) do
      researcher.name = auth_hash[:info][:email]
    end
    byebug
    researcher
  end
end
