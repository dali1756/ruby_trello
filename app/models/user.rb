class User < ApplicationRecord
  has_secure_password

  has_many :tasks
  has_many :user_projects
  has_many :projects, through: :user_projects

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
end
