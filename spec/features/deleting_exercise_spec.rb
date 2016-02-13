require 'rails_helper'

RSpec.feature 'Deleting Exercise' do
  before do
    @owner = User.create(first_name: 'John', last_name: 'Owner', email: 'owner@example.com', password: 'password')
    @owner_exer = @owner.exercises.create!(duration_in_min: '70', workout: 'running', workout_date: Date.today)
    login_as(@owner)
  end
  
  scenario do
    visit root_path
    click_link 'My Lounge'
    link = "//a[contains(@href, 'users/#{@owner.id}/exercises/#{@owner_exer.id}') and .//text()='Delete']"
    find(:xpath, link).click

    expect(page).to have_content 'Exercise has been deleted.'
  end
end
