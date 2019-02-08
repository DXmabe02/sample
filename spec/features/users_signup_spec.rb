require 'rails_helper'

RSpec.feature "UsersSignups", type: :feature do

  scenario "invalid signup information" do
    visit signup_path
    fill_in 'Name', with: ""
    fill_in 'Email', with: "user@invalid"
    fill_in 'Password', with: "foo"
    fill_in 'Confirmation', with: "bar"
    expect{ click_button 'Create my account'}.to_not change{ User.count}
    expect(page).to have_selector 'h1', text: 'Sign up'
  end

  # scenario "invalid signup information" do
    #visit signup_path
    #fill_in 'Name', with: "Example user"
    #fill_in 'Email', with: "example@user.com"
    #fill_in 'Password', with: "password"
    #fill_in 'Confirmation', with: "password"
  #end
end
