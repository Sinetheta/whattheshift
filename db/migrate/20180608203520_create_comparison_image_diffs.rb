class CreateComparisonImageDiffs < ActiveRecord::Migration[5.2]
  def change
    create_table :comparison_image_diffs do |t|
      t.references :comparison, foreign_key: true
      t.references :image_diff, foreign_key: true

      t.timestamps
    end
  end
end
