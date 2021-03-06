require 'rails_helper'

RSpec.feature 'Listing Exercises' do
  before do
    @john = User.create(first_name: 'John', last_name: 'Smith', email: 'john@example.com', password: 'password')
    @sarah = User.create(first_name: 'Sarah', last_name: 'Smith', email: 'sarah@example.com', password: 'password')
    login_as(@john)
    @e1 = @john.exercises.create(duration_in_min: '70', workout: 'running', workout_date: Date.today)
    @e2 = @john.exercises.create(duration_in_min: '30', workout: 'jumping', workout_date: Date.today)
    @following = Friendship.create(friend: @sarah, user: @john)
  end

  scenario 'shows user\'s workout for last 7 days' do
    visit root_path
    click_link 'My Lounge'

    expect(current_path).to eq user_exercises_path(@john)
    
    expect(page).to have_content @e1.duration_in_min
    expect(page).to have_content @e1.workout
    expect(page).to have_content @e1.workout_date

    expect(page).to have_content @e2.duration_in_min
    expect(page).to have_content @e2.workout
    expect(page).to have_content @e2.workout_date
  end

  scenario 'shows a list of user\'s friends' do
    visit root_path
    click_link 'My Lounge'

    expect(page).to have_content 'My Friends'
    expect(page).to have_link @sarah.full_name
    expect(page).to have_link 'Unfollow'
  end
end
