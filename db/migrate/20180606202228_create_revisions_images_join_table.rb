class CreateRevisionsImagesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :revisions, :images do |t|
      t.index :revision_id
      t.index :image_id
    end
  end
end
