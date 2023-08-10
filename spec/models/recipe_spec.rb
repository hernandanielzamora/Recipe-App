require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.create(name: 'Hernán')
    @recipe = Recipe.new(name: 'Milanesa', user_id: @user.id,
                         description: 'Milanesa, one of the most famous argentinian dishes',
                         preparation_time: 2, cooking_time: 1,
                         public: true)
  end

  describe 'Initialize: ' do
    it 'A new recipe must be created' do
      expect(@recipe).to be_a(Recipe)
    end

    it 'Attributes must be present' do
      expect(@recipe).to have_attributes(name: 'Milanesa', user_id: @user.id,
                                         description: 'Milanesa, one of the most famous argentinian dishes',
                                         preparation_time: 2,
                                         cooking_time: 1, public: true)
    end
  end

  describe 'Validations: ' do
    before(:each) do
      expect(@recipe).to be_valid
    end

    it 'Name must be present' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'Name length must be < 51' do
      @recipe.name = 'a' * 51
      expect(@recipe).to_not be_valid
    end

    it 'Description must be present' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end

    it 'Preparation time must be present' do
      @recipe.preparation_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'Cooking time must be present' do
      @recipe.cooking_time = nil
      expect(@recipe).to_not be_valid
    end
  end
end
