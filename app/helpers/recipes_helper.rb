module RecipesHelper
  def food_quantity(food)
    @user.recipes.joins(:foods).where(foods: { id: food.id }).sum('recipe_foods.quantity')
  end
end