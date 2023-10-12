require 'rails_helper'

RSpec.describe 'Splash Page', type: :feature do
  before do
    visit unauthenticated_root_path
  end

  it 'displays the app logo' do
    expect(page).to have_selector('.app-logo')
    expect(page).to have_selector('.logo-title', text: 'My Finances')
  end

  it 'displays the "Log In" link' do
    expect(page).to have_link('Log In', href: new_user_session_path, class: 'login-button')
  end

  it 'displays the "Sign Up" link' do
    expect(page).to have_link('Sign Up', href: new_user_registration_path, class: 'signup-button')
  end
end
