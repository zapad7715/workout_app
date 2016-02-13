require 'rails_helper'

RSpec.feature 'Searching for User' do
  before do
    @john = User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password')
    @sarah = User.create(first_name: 'Sarah', last_name: 'Doe', email: 'sara@example.com', password: 'password')
  end

  scenario 'with exesting name returns all those users' do
    visit root_path
    
    fill_in 'search_name', with: 'Doe'
    click_button 'Search'

    expect(page).to have_content @john.full_name
    expect(page).to have_content @sarah.full_name
    expect(current_path).to eq '/dashboard/search'
  end
end
