Rails.application.routes.draw do
  devise_for :users
  root "recipes#index"
  resources :foods
  resources :recipes
  resources :recipe_foods
  get '/public_recipes', to: 'recipes#public_recipes'
end
