class ProjectMember < ApplicationRecord
  belongs_to :user
  belongs_to :project

  enum role: [:admin, :member]
end
