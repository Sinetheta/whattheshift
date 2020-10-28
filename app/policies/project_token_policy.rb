class ProjectTokenPolicy < ApplicationPolicy
  def create?
    contributor?
  end

  private

  def contributor?
    ProjectMember.where(project: record.project, user: user, role: [:admin, :member]).any?
  end
end
