require "rails_helper"

RSpec.feature "Creating Exercise" do
 
before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    @Sue = User.create(first_name: "Sue", last_name: "Smith", email: "sue@example.com", password: "password")
    login_as(@john)
end
 
scenario "if signed in succeeds" do
  visit "/"  
  
  expect(page).to have_content(@john.full_name)
  expect(page).to have_content(@sue.full_name)
  expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@john.id}")
  
  link = "a[href='/friendships?friend_id=#{@sue.id}']"
  find(link).click
  expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@sue.id}")
  
  end
end
