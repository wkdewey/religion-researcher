class Researcher < ApplicationRecord
  has_many :projects
  has_secure_password
  validates :name, :email, presence: true, uniqueness: true

  # def self.find_or_create_from_auth_hash(auth_hash)
  #   byebug
  #   researcher = self.find_or_create_by(email: auth_hash[:info][:email]) do
  #     researcher.name = auth_hash[:info][:email]
  #   end
  #   researcher
  # end
end
