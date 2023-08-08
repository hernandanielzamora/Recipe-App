Rails.application.routes.draw do
  devise_for :users
  root "recipes#index"
  resources :foods
  resources :recipes
  resources :recipe_foods, only: [:new, :create, :index, :edit]
  resources :shopping_lists, only: %i[index]
  resources :users do
    get :general_food_list, on: :member
  end
  get '/recipes/missing_food', to: 'recipes#missing_food', as: 'missing_food'
  get '/public_recipes' => 'recipes#public_recipes'
  patch '/recipe_foods/:id', to: 'recipe_foods#update', as: :update_recipe_food
  delete '/recipe_foods/:id', to: 'recipe_foods#destroy', as: :destroy_recipe_food
end
