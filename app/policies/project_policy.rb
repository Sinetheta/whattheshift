class ProjectPolicy < ApplicationPolicy
  def create?
    ensure_login!
  end

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
