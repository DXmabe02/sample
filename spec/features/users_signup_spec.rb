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
    #expect(flash).to be_empty  #flashのテストを追加してみたがエラー発生 undefind method"flash"
  end

  scenario "invalid signup information" do
    visit signup_path
    fill_in 'Name', with: "Example user"
    fill_in 'Email', with: "example@user.com"
    fill_in 'Password', with: "password"
    fill_in 'Confirmation', with: "password"
    expect{ click_button 'Create my account'}.to change{ User.count}.by(1)
    #expect(flash).to be_present  #flashのテストを追加してみたがエラー発生
  end

end
