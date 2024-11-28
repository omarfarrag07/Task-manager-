class Project < ApplicationRecord
  has_many :users, through: :members
  has_many :members
  has_many :sprints
  has_many :tasks, dependent: :destroy
end
