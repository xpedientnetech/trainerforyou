require "rails_helper"

RSpec.feature "Editing Exercise" do
 
before do
    @owner = User.create(email: "owner@example.com", password: "password")
    
    
    @owner_exer = @owner.excercises.create!(duration_in_min: 45, workout: "cardio activity", workout_date: Date.today)
    login_as(@owner)
end
 
scenario "with valid inputs succeeds" do
  visit "/"  
  
  click_link "my lounge"
  link = "a[href='/users/#{@owner.id}/exercises/#{@owner_exer.id}/edit']"
  find(link).click
  fill_in "Duration", with: 50
  click_button "Update Exercise"
  expect(page).to have_content("Exercise has been updated")
  expect(page).to have_content("50")
  expect(page).not_to have_content("45")
end 
end