class RemoveDescriptionFromImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :description, :string
  end
end
