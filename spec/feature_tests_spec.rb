require 'spec_helper'
require 'test_helpers'

feature 'Viewing the homepage' do
  scenario "allows user to visit homepage" do
    visit('/')
    expect(page).to have_content "welcome to makersbnb"
  end
end

feature 'User can sign up' do
  scenario "allows user to sign up" do
    visit('/')
    fill_in :email, with: 'rspec@test.com'
    fill_in :password, with: '1234'
    click_button("submit")

    expect(page).to have_content 'welcome to makersbnb'
  end
end

feature 'Authentication' do
  scenario "user can log in" do
    signup_and_login
    expect(page).to have_content("welcome test@example.com")
  end

  scenario "a user sees an error message if email is wrong" do
    User.create(email: 'test@example.com', password: 'password123')

   visit '/login'
   fill_in(:email, with: 'wrong@wrong.wrong')
   fill_in(:password, with: 'password123')
   click_button('log in')
   expect(page).not_to have_content 'Welcome, test@example.com'
   expect(page).to have_content 'wrong email or password'
 end

 scenario "a user sees an error message if password is wrong" do
    User.create(email: 'test@example.com', password: 'password123')

    visit '/login'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('log in')
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'wrong email or password'
 end
end

feature 'Signing out' do
  scenario 'a user can sign out' do
    signup_and_login
    click_button('log out')
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'you have signed out'
  end
end

xfeature 'Viewing listings' do
  scenario 'a user can see a list of spaces after logging in' do
    signup_and_login
    expect(page).to have_content 'listings'
  end
end

xfeature 'Creating a listing' do
  scenario 'a user can create a listing' do
    signup_and_login

    # user makes a listing on a create listing page
    # user can view listing on view listings page
  end
end

 # scenario 'a user cant sign up with empty details' do
 #   visit '/'
 #   click_button('sign up')
 #   click_button('log in')
 #   click_button('log in')
 #   expect()
