class CreateRecipesCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes_categories do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
