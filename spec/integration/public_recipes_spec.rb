require 'rails_helper'

RSpec.describe 'recipes/public_recipes.html.erb', type: :view do
  describe 'Testing public recipes page' do
    before(:each) do
      @user = User.create(name: 'Eric', email: 'hernanzamora1999@gmail.com', password: '123456')

      @recipe1 = Recipe.create(name: 'Pasta', user_id: @user.id, preparation_time: 2, cooking_time: 0.2,
                               description: 'Famous italian dish', public: true)
      @recipe2 = Recipe.create(name: 'Sushi', user_id: @user.id, preparation_time: 3, cooking_time: 0.1,
                               description: 'Famous Asian dish', public: true)
      @recipe3 = Recipe.create(name: 'Steak', user_id: @user.id, preparation_time: 1, cooking_time: 0.5,
                               description: 'Common dish', public: true)

      @food1 = Food.create(name: 'chicken', measurement_unit: 3, quantity: 3, price: 4, user_id: @user.id)
      @food2 = Food.create(name: 'Beef', measurement_unit: 3, quantity: 2, price: 3, user_id: @user.id)

      @recipe_food1 = RecipeFood.create(quantity: 3, recipe_id: @recipe1.id, food_id: @food1.id)
      @recipe_food2 = RecipeFood.create(quantity: 2, recipe_id: @recipe1.id, food_id: @food2.id)

      assign(:user, @user)
      assign(:recipes, [@recipe1, @recipe2, @recipe3])
      assign(:foods, [@food1, @food2])
      assign(:recipe_foods, [@recipe_food1, @recipe_food2])

      render
    end

    it 'Shows number of food items in a public recipe' do
      expect(rendered).to have_content 'Food Items: 2'
    end

    it "Shows the user name of the public recipe's owner" do
      expect(rendered).to have_content 'By: Eric'
    end

    it 'Shows the food ids' do
      expect(rendered).to have_content "Food IDs: [#{@recipe_food1.food_id}, #{@recipe_food2.food_id}]"
    end
  end
end
