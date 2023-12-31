require 'rails_helper'

RSpec.describe 'shopping_lists/index.html.erb', type: :view do
  describe 'Testing shopping list index page' do
    before(:each) do
      @user = User.create(name: 'Hernán', email: 'hernanzamora1999@gmail.com', password: '123456')

      @recipe1 = Recipe.create(name: 'Pasta', user_id: @user.id, preparation_time: 2, cooking_time: 0.2,
                               description: 'Famous italian dish', public: true)
      @recipe2 = Recipe.create(name: 'Sushi', user_id: @user.id, preparation_time: 3, cooking_time: 0.1,
                               description: 'Famous Asian dish', public: true)
      @recipe3 = Recipe.create(name: 'Steak', user_id: @user.id, preparation_time: 1, cooking_time: 0.5,
                               description: 'Common dish', public: true)

      @sum = 0
      @food1 = Food.create(name: 'chicken', measurement_unit: 3, quantity: 3, price: 4, user_id: @user.id)
      @food2 = Food.create(name: 'Beef', measurement_unit: 3, quantity: 2, price: 3, user_id: @user.id)

      @recipe_food1 = RecipeFood.create(quantity: 3, recipe_id: @recipe1.id, food_id: @food1.id)
      @recipe_food2 = RecipeFood.create(quantity: 2, recipe_id: @recipe1.id, food_id: @food2.id)

      assign(:recipes, [@recipe1, @recipe2, @recipe3])
      assign(:foods, [@food1, @food2])
      assign(:recipe_foods, [@recipe_food1, @recipe_food2])

      render
    end

    it 'Check if the recipes have been added to the list' do
      expect(rendered).to have_content 'Shopping List'
      expect(rendered).to have_content 'Beef'
      expect(rendered).to have_content 'chicken'
      expect(rendered).to have_content 'Amount of food items to buy: 2'
      expect(rendered).to have_content 'Total Value of food needed: $18'
    end
  end
end
