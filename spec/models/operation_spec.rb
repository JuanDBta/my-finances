require 'rails_helper'

RSpec.describe Operation, type: :model do
  let(:user) do
    User.create(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  let(:category) do
    Category.new(
      name: 'Fast Food',
      icon: 'imgexample.png',
      user:
    )
  end

  it 'is valid with valid attributes' do
    operation = Operation.new(
      name: 'Burger',
      amount: 1.5,
      user:,
      category:
    )
    expect(operation).to be_valid
  end

  describe 'associations' do
    it 'belongs to user' do
      operation = Operation.new(
        name: 'Burger',
        amount: 1.5,
        user:,
        category:
      )
      expect(operation.user).to eq(user)
    end

    it 'belongs to category' do
      operation = Operation.new(
        name: 'Burger',
        amount: 1.5,
        user:,
        category:
      )
      expect(operation.category).to eq(category)
    end
  end
end