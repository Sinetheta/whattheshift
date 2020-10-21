class ProjectPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def update?
    ProjectMember.where(project: record, user: user, role: [:admin, :member]).any?
  end
end
