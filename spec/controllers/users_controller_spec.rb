require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET #index' do
    it 'returns a success response' do
      get :index
      response.successful?
    end
  end

  context 'GET #show' do
    it 'returns a success response' do
      user = User.create(username: 'username', email: 'sample@example.com', password: '123456', password_confirmation: '123456')
      get :show, params: { id: user.to_param }
      response.successful?
    end
  end
end
