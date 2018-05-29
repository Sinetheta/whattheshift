class CreateRevisions < ActiveRecord::Migration[5.2]
  def change
    create_table :revisions do |t|
      t.string :identifier

      t.timestamps
    end
  end
end
