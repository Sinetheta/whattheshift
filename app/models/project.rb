class Project < ApplicationRecord
  has_many :project_tokens
  has_many :scenarios
end
