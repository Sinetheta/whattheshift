class AddProjectIdToRevisions < ActiveRecord::Migration[5.2]
  def change
    add_reference :revisions, :project, foreign_key: true
  end
end
