class ReferenceScenarioNotProjectOnRevision < ActiveRecord::Migration[5.2]
  def change
    add_reference :revisions, :scenario, foreign_key: true
    remove_column :revisions, :project_id, :string
  end
end
