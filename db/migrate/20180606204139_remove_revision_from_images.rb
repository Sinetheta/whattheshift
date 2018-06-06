class RemoveRevisionFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :revision_id, :string
  end
end
