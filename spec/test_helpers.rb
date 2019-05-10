require 'user'
require 'listing'

def signup2
  User.create(email: 'test@example.com', password: 'password123')
end

def signup
  User.create(email: 'test@example.com', password: 'password123')
  visit '/login'
end

def signup_and_login
  User.create(email: 'test@example.com', password: 'password123')
  visit '/login'
  fill_in :email, with: 'test@example.com'
  fill_in :password, with: 'password123'
  click_button('log in')
end

def populate_listings
  user = User.create(email: 'test@example.com', password: 'password123')
  Listing.create(owner_id: user.id, name: 'test_1', description: '1_description', price: 10.00)
  Listing.create(owner_id: user.id, name: 'test_2', description: '2_description', price: 20.00)
  Listing.create(owner_id: user.id, name: 'test_3', description: '3_description', price: 30.00)
  Listing.create(owner_id: user.id, name: 'test_4', description: '4_description', price: 40.00)
  Listing.create(owner_id: user.id, name: 'test_5', description: '5_description', price: 50.00)
  Listing.create(owner_id: user.id, name: 'test_6', description: '6_description', price: 60.00)
end
