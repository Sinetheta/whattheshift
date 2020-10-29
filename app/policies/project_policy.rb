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
    contributor?
  end

  private

  def contributor?
    ProjectMember.where(project: record, user: user, role: [:admin, :member]).any?
  end
end
