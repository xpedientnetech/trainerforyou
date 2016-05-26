require "rails_helper"

RSpec.feature "Deleting Exercise" do
 
before do
    @owner = User.create(email: "owner@example.com", password: "password")
    
    
    @owner_exer = @owner.excercises.create!(duration_in_min: 48, workout: "cardio special", workout_date: Date.today)
    login_as(@owner)
end
 
scenario  do
  visit "/"  
  
  click_link "my lounge"
  link = "//a[contains(@href, '/user/#{@owner.id}/excercises/#{@owner_exer.id}') and .//text()='Destroy']"
  find(:xpath, link).click
  
  expect(page).to have_content("Exercise has been deleted")
end 
end