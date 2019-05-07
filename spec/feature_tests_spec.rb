require 'spec_helper'

feature 'Viewing the homepage' do
  scenario "allows user to visit homepage" do
    visit('/')
    expect(page).to have_content "welcome to makersbnb"
  end
end
