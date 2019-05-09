require 'spec_helper'

feature 'Viewing the homepage' do
  scenario "allows user to visit homepage" do
    visit('/')
    expect(page).to have_content "welcome to makersbnb"
  end
end

feature 'User can sign up' do
  scenario "allows user to sign up" do
    visit('/')
    within('#signup-form') do
      fill_in :email, with: 'rspec@test.com'
      fill_in :password, with: '1234'
      click_button("submit")
    end

    expect(page).to have_content 'welcome rspec@test.com!'
  end
end

feature 'authentication' do
  scenario "user can log in" do
    User.create(email: 'test@example.com', password: 'password123')

    visit('/')
    click_button('login-1')

    within('#login-form') do
      fill_in :email, with: 'test@example.com'
      fill_in :password, with: 'password123'
      click_button('login-2')
    end

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

 scenario 'a user can sign out' do
   User.create(email: 'test@example.com', password: 'password123')
   visit '/login'
   fill_in :email, with: 'test@example.com'
   fill_in :password, with: 'password123'
   click_button('log in')
   click_button('log out')
   expect(page).not_to have_content 'Welcome, test@example.com'
   expect(page).to have_content 'you have signed out'
 end

 # scenario 'a user cant sign up with empty details' do
 #   visit '/'
 #   click_button('sign up')
 #   click_button('log in')
 #   click_button('log in')
 #   expect()


end
