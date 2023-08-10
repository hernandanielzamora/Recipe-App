require 'rails_helper'

RSpec.describe 'recipes/show.html.erb', type: :view do
  describe 'Testing recipes show page' do
    before(:each) do
      @user = User.create(name: 'Hernán', email: 'hernanzamora1999@gmail.com', password: '123456')

      @recipe = Recipe.create(name: 'Pasta', user_id: @user.id, preparation_time: 2, cooking_time: 0.2,
                              description: 'Famous italian dish', public: true)

      @food1 = Food.create(name: 'chicken', measurement_unit: 3, quantity: 3, price: 4, user_id: @user.id)
      @food2 = Food.create(name: 'Beef', measurement_unit: 3, quantity: 2, price: 3, user_id: @user.id)

      @recipe_food1 = RecipeFood.create(quantity: 3, recipe_id: @recipe.id, food_id: @food1.id)
      @recipe_food2 = RecipeFood.create(quantity: 2, recipe_id: @recipe.id, food_id: @food2.id)

      assign(:recipe, @recipe)
      assign(:foods, [@food1, @food2])
      assign(:recipe_foods, [@recipe_food1, @recipe_food2])

      render
    end

    it 'Check if the recipes have been added to the list' do
      expect(rendered).to have_content 'chicken'
    end
  end
end
