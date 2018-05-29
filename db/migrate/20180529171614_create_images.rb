class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :identifier
      t.string :signature
      t.string :description
      t.references :revision, foreign_key: true

      t.timestamps
    end
  end
end
