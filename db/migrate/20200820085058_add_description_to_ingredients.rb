class AddDescriptionToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :description, :string
  end
end
