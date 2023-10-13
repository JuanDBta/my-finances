require 'rails_helper'

RSpec.describe 'Categories', type: :request do
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
end
