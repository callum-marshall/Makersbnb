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
    expect(page).to have_content 'rspec@test.com'
  end
end

feature 'authentication' do
  scenario "user can sign in" do
    #User.create(email: 'test@example.com', password: 'password123')

    visit('/')
    click_button('log in')
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'password123'
    click_button('log in')
    expect(page).to have_content("welcome test@example.com")
  end
end
