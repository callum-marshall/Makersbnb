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
