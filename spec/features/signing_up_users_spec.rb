require "rails_helper"

RSpec.feature "Signing Up Users" do
    
scenario "with valid credentials" do
      visit "/"
      
      click_link "sign up"
      fill_in "first_name", with: "john"
      fill_in "last_name", with: "smith"
        fill_in "email", with: "user.example.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button  "sign up"
        
        expect(page).to have_content("You have signed up successfully.")
        visit "/"
        expect(page).to have_content("John Smith")
        
  end
  
  scenario "with invalid credentials" do
      visit "/"
      
      click_link "sign up"
      fill_in "first_name", with: ""
      fill_in "last_name", with: ""
        fill_in "email", with: "user.example.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button  "sign up"
        
        expect(page).to have_content("First name cannot be blank.")
        expect(page).to have_content("Last name cannot be blank.")
       
        
  end
  
end