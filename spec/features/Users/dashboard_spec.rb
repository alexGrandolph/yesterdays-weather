require 'rails_helper'

RSpec.describe 'User Dashboard' do

  it 'displays the users username' do
    visit '/register'

    fill_in 'Username:', with: 'Skeeter8'
    fill_in 'Email:', with: 'skeeter@corgi.com'
    fill_in 'Phone Number:', with: '3033033033'
    fill_in 'Password:', with: 'test'
    fill_in 'Password Confirmation:', with: 'test'
    click_on 'Submit'
    
    expect(page).to have_content('Welcome, Skeeter8')
  end

  it 'has a link to add a location' do
    visit '/register'

    fill_in 'Username:', with: 'Skeeter8'
    fill_in 'Email:', with: 'skeeter@corgi.com'
    fill_in 'Phone Number:', with: '3033033033'
    fill_in 'Password:', with: 'test'
    fill_in 'Password Confirmation:', with: 'test'
    click_on 'Submit'
    
    click_link 'Add Location'
    expect(current_path).to eq('/locations/new')
  end


end