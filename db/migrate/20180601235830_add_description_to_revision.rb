class AddDescriptionToRevision < ActiveRecord::Migration[5.2]
  def change
    add_column :revisions, :description, :string
  end
end
