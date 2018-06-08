class CreateImageDiffs < ActiveRecord::Migration[5.2]
  def change
    create_table :image_diffs do |t|
      t.references :before_image, index: true, foreign_key: { to_table: :images }
      t.references :after_image, index: true, foreign_key: { to_table: :images }

      t.timestamps
    end
  end
end
