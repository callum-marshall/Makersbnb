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
    fill_in :email, with: 'rspec@test.com'
    fill_in :password, with: '1234'
    click_button("submit")

    expect(page).to have_content 'welcome to makersbnb'
  end
end

feature 'authentication' do
  scenario "user can log in" do
    User.create(email: 'test@example.com', password: 'password123')

    visit('/')
    click_button('log in')
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'password123'
    click_button('log in')

    expect(page).to have_content("welcome test@example.com")
  end

  scenario "a user sees an error message if email is wrong" do
    User.create(email: 'test@example.com', password: 'password123')

   visit '/login'
   fill_in(:email, with: 'wrong@wrong.wrong')
   fill_in(:password, with: 'password123')
   click_button('log in')
   expect(page).not_to have_content 'Welcome, test@example.com'
   expect(page).to have_content 'wrong email'
 end
end
