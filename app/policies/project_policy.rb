class ProjectPolicy < ApplicationPolicy
  def show?
    ProjectMember.where(project: record, user: user, role: [:admin, :member]).any?
  end
end
