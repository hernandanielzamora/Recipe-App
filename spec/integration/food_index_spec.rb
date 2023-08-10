require 'rails_helper'

RSpec.describe 'foods/index.html.erb', type: :view do
  describe 'Testing foods index page' do
    before(:each) do
      @user = User.create(name: 'Hernán', email: 'hernanzamora1999@gmail.com', password: '123456')
      @food1 = Food.create(name: 'chicken', measurement_unit: 3, quantity: 3, price: 4, user_id: @user.id)
      @food2 = Food.create(name: 'Beef', measurement_unit: 1, quantity: 2, price: 3, user_id: @user.id)

      assign(:foods, [@food1, @food2])
      render
    end

    it 'Check if the foods have been added to the list' do
      expect(rendered).to have_content 'Beef'
      expect(rendered).to have_content 'chicken'
    end

    it 'Shows the price of each food' do
      expect(rendered).to have_content '$4.00'
      expect(rendered).to have_content '$3.00'
    end

    it 'Shows a delete button to delete a food' do
      expect(rendered).to have_button('Delete')
    end
  end
end
