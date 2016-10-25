require 'rails_helper'

RSpec.feature 'UserLogins', type: :feature, js: true do

  before :each do
    user = User.create!(first_name: 'bob', last_name: 'bob', email: 'email', password: '123456', password_confirmation: '123456')
  end

  scenario 'With correct login credentials, login successfully and redirect to homepage' do
    visit login_path

    first()
    fill_in '#first_name', with: 'bob'
    fill_in '#last_name', with: 'bob'
    fill_in '#email', with: 'email'
    fill_in '#password', with: '123456'

    click_button 'Submit'
    expect(page).to have_css('#navbar', text: 'Logout')
    save_screenshot
  end

end
