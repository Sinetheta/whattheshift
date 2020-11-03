class ComparisonPolicy < ApplicationPolicy
  def create?
    contributor?
  end

  def index?
    true
  end

  def show?
    true
  end

  private

  def contributor?
    ProjectMember.where(project: record.project, user: user, role: [:admin, :member]).any?
  end
end
