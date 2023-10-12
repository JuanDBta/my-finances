require 'rails_helper'

RSpec.describe 'Categories Index', type: :feature do
  let(:user) do
    User.create(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  before do
    sign_in user
  end

  it 'displays the page title' do
    visit categories_path
    expect(page).to have_content('add a new category')
  end

  it 'displays the "Add a new category" button' do
    visit categories_path
    expect(page).to have_button('sign out')
  end
end
