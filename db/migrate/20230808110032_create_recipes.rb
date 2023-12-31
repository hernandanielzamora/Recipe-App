class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.boolean :public
      t.integer :preparation_time
      t.integer :cooking_time

      t.timestamps
    end
  end
end
