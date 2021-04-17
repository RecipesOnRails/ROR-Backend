class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :api_id
      t.string :title
      t.timestamps
    end
  end
end
