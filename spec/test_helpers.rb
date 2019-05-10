require 'user'
require 'listing'

def signup_and_login
  User.create(email: 'test@example.com', password: 'password123')
  visit '/login'
  fill_in :email, with: 'test@example.com'
  fill_in :password, with: 'password123'
  click_button('log in')
end
