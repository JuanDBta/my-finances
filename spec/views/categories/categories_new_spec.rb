require 'rails_helper'

RSpec.describe 'Categories New', type: :feature do
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
    visit new_category_path
  end


  it 'displays the category name input field' do
    expect(page).to have_field('category_name')
  end

  it 'displays the category icon select field' do
    expect(page).to have_select('category_icon')
  end

  it 'displays the "Save" button' do
    expect(page).to have_button('Save')
  end
end
