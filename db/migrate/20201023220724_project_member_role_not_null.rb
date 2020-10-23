class ProjectMemberRoleNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :project_members, :role, false
  end
end
