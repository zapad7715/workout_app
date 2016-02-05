require 'rails_helper'

RSpec.feature 'Creating Home Page' do
  scenario do
    visit root_path

    expect(page).to have_link 'Athletes Den'
    expect(page).to have_link 'Home'
    expect(page).to have_content 'Workout Lounge'
  end
end
