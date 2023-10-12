require 'rails_helper'

RSpec.feature 'Operations', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category) }
  let(:operation) { FactoryBot.create(:operation, category:) }
  before do
    sign_in user
  end

  scenario 'User visits the payment show page' do
    visit new_category_operation_path(category, operation)

    expect(page).to have_content('TRANSACTIONS')
    expect(page).to have_content('Select a category')
    expect(page).to have_button('Save')
  end
end