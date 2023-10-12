require 'rails_helper'

RSpec.feature 'Operations', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category) }
  let(:operations) { FactoryBot.create_list(:operation, 3, category: category, user: user) }

  before do
    sign_in user
  end

  scenario 'User views the operations page for a category' do
    visit category_operations_path(category)

    expect(page).to have_content('TRANSACTIONS')
    expect(page).to have_link('add a new transaction', href: new_category_operation_path(category))
  end
end
