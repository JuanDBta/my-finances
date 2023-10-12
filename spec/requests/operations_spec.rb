require 'rails_helper'

RSpec.describe OperationsController, type: :controller do
  let(:user) do
    User.create(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  before(:each) do
    sign_in user
  end

  let(:category) do
    Category.create(
      name: 'Fast Food',
      icon: 'imgexample.png',
      user:
    )
  end

  describe 'GET /operations' do
    it 'returns a successful response for operations for a specific category' do
      get :index, params: { category_id: category.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template for operations of a specific category' do
      get :index, params: { category_id: category.id }
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new, params: { category_id: category.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new, params: { category_id: category.id }
      expect(response).to render_template(:new)
    end
  end
end
