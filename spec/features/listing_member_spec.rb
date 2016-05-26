require "rails_helper"

RSpec.feature "Listing Exercise" do
 
before do
    @john = User.create(first_name: "john", last_name: "smith", email: "john@example.com", password: "password")
    @sara = User.create(first_name: "sarah", last_name: "jones", email: "sara@example.com", password: "password")
    login_as(@john)
end
 
scenario "shows a list of registered members" do
  visit "/"  
  
  
  expect(page).to have_content("List of members")
  expect(page).to have_content(@john.full_name)
  expect(page).to have_content(@sarah.full_name)
  
  end
end


   