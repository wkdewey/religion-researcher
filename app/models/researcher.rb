class Researcher < ApplicationRecord
  has_many :projects
  has_secure_password
  validates :name, :email, :password_digest, presence: true
end
