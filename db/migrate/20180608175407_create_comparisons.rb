class CreateComparisons < ActiveRecord::Migration[5.2]
  def change
    create_table :comparisons do |t|
      t.references :from_revision, index: true, foreign_key: { to_table: :revisions }
      t.references :to_revision, index: true, foreign_key: { to_table: :revisions }

      t.timestamps
    end
  end
end
