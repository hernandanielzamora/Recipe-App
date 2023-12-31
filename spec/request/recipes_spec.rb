require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /index' do
    it 'Returns http success' do
      @user = User.create(name: 'Burger', email: 'burger@gmail.com', password: '123456',
                          password_confirmation: '123456')

      login_as(@user, scope: :user)

      get '/recipes'
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end
end
