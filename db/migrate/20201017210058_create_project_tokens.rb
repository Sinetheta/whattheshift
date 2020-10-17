class CreateProjectTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :project_tokens, id: :uuid do |t|
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
