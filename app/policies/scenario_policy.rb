class ScenarioPolicy < ApplicationPolicy
  def create?
    contributor?
  end

  def destroy?
    contributor?
  end

  def index?
    contributor?
  end

  def run?
    contributor?
  end

  def show?
    contributor?
  end

  def update?
    contributor?
  end

  private

  def contributor?
    ProjectMember.where(project: record.project, user: user, role: [:admin, :member]).any?
  end
end
