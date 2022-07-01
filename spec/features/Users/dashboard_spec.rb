require 'rails_helper'

RSpec.describe 'User Dashboard' do

  it 'filling in sign up form correctly redirects to users dashboard' do
    visit '/register'

    fill_in 'Username:', with: 'Skeeter8'
    fill_in 'Email:', with: 'skeeter@corgi.com'
    fill_in 'Phone Number:', with: '3033033033'
    fill_in 'Password:', with: 'test'
    fill_in 'Password Confirmation:', with: 'test'
    click_on 'Submit'
    
    expect(page).to have_content('Welcome, Skeeter8')

  end
end