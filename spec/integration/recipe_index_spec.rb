require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :view do
  describe 'Testing recipes index page' do
    before(:each) do
      @user = User.create(name: 'Hernán', email: 'hernanzamora1999@gmail.com', password: '123456')

      @recipe1 = Recipe.create(name: 'Pasta', user_id: @user.id, preparation_time: 2, cooking_time: 0.2,
                               description: 'Famous italian dish', public: true)
      @recipe2 = Recipe.create(name: 'Sushi', user_id: @user.id, preparation_time: 3, cooking_time: 0.1,
                               description: 'Famous Asian dish', public: true)
      @recipe3 = Recipe.create(name: 'Steak', user_id: @user.id, preparation_time: 1, cooking_time: 0.5,
                               description: 'Common dish', public: true)

      assign(:recipes, [@recipe1, @recipe2, @recipe3])

      render
    end

    it 'Check if the recipes have been added to the list' do
      expect(rendered).to have_content 'Pasta'
      expect(rendered).to have_content 'Sushi'
      expect(rendered).to have_content 'Steak'
    end
  end
end
