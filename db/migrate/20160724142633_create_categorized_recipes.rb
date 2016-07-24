class CreateCategorizedRecipes < ActiveRecord::Migration
  def change
    create_table :categorized_recipes do |t|
      t.integer :recipe_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
