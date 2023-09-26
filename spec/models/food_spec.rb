require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.create(name: 'Hernán')
    @food = Food.new(name: 'Meat', user_id: @user.id, measurement_unit: 'KG', price: 10, quantity: 1)
  end

  describe 'Initialize: ' do
    it 'A new food has to be created' do
      expect(@food).to be_a(Food)
    end

    it 'The new food must have atributes' do
      expect(@food).to have_attributes(name: 'Meat', user_id: @user.id, measurement_unit: 'KG', price: 10,
                                       quantity: 1)
    end
  end

  describe 'Validations: ' do
    before(:each) do
      expect(@food).to be_valid
    end

    it 'Food must have a name' do
      @food.name = 'M'
      expect(@food).to_not be_valid
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'Name length must be < 51' do
      @food.name = 'a' * 51
      expect(@food).to_not be_valid
    end

    it 'The measurement unit must be present' do
      @food.measurement_unit = nil
      expect(@food).to_not be_valid
    end

    it 'Price must be present' do
      @food.price = nil
      expect(@food).to_not be_valid
    end
  end
end
