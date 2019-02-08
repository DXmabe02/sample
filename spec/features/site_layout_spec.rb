require 'rails_helper'

RSpec.feature "SiteLayouts", type: :feature do
  scenario "layout links" do
    visit root_path
    expect(page).to have_link nil, href: root_path, count: 2
    expect(page).to have_link nil, href: help_path
  end
end
