class CreateScripts < ActiveRecord::Migration[5.2]
  def change
    create_table :scripts do |t|
      t.string :type
      t.text :body
      t.references :scenario, foreign_key: true
      t.timestamps
    end
  end
end
