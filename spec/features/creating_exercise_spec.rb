require "rails_helper"

RSpec.feature "Creating Exercise" do
 
before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
end
 
scenario "with valid inputs" do
  visit "/"  
  
  click_link "my lounge"
  click_link "new workout"
  expect(page).to have_link("back")
  
  fill_in "Duration", with: 70
  fill_in "Workout details", with: "weight lifting"
  fill_in "Actvity Date", with: Date.today
  click_button "Create Exercise"
  
  expect(page).to have_content("Exercise has been created")
   
  exercise = Exercise.last 
  expect(page.current_path).to eq(user_exercise_path(@john, exercise))
    
end

scenario "with invalid inputs" do
    visit "/"
   
   click_link "my lounge"
   click_link "new workout"
   expect(page).to have_link("back")
   
   fill_in "Duration", with: nil
   fill_in "Workout details", with: ""
   fill_in "Actvity Date", with: ""
   click_button "Create Exercise"
   
   expect(page).to have_content("Exercise has not been created")
   
   expect(page).to have_content("Duration in minutes can not be blank")
   expect(page).to have_content("Duration in minutes is not a number")
   expect(page).to have_content("Workout can not be blank")
   expect(page).to have_content("Workout date can not be blank")
    

end
    
end

