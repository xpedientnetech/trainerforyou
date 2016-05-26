require "rails_helper"

RSpec.feature "Unfolloing friend" do
    before do
        @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
        @sara = User.create(first_name: "Sara", last_name: "Smith", email: "saran@example.com", password: "password")
        
        login_as(@john)
        
        @following = Friendship.create(user: @john, friend: @sara)
    end
    
    scenario do 
        visit "/"
        click_link "My lounge"
        link = "a[href='/friendships/#{@following.id}][data-method='delete']"
        find(link).click
        
        expect(page).to have_content(@sara.full_name + " unfollowed ")
    end
end
