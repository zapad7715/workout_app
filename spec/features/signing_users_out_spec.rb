require 'rails_helper'

RSpec.feature 'Users sign out' do
  before do
    @john = User.create!(first_name: 'John', last_name: 'Smith', email: 'john@example.com', password: 'password')
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: @john.email
    fill_in 'Password', with: @john.password
    click_button 'Log in'
  end

  scenario 'as a signed-in user' do
    visit root_path
    click_link 'Sign out'

    expect(page).to have_content 'Signed out successfully.'
  end
end
