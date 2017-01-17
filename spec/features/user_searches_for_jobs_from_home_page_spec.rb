require 'rails_helper'

feature 'User searches for jobs from the home page', type: 'feature' do
  scenario "with 'web developer'", vcr: true do
    visit root_path
    fill_in_search_form

    verify_valid_data
  end

  def fill_in_search_form
    fill_in  '_job_search_keywords', with: 'web developer'

    click_on 'submit_job_search'
  end

  def verify_valid_data
    expect(page).to have_content 'Spotify, New York'
    expect(page).to have_content "Results for 'web developer'"
  end
end
