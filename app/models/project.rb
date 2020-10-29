class Project < ApplicationRecord
  has_many :members, class_name: 'ProjectMember'
  has_many :project_tokens
  has_many :scenarios
end
