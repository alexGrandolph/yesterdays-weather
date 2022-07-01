require 'rails_helper'

RSpec.describe 'User Dashboard' do
  before do
    visit '/register'

    fill_in 'Username:', with: 'Skeeter8'
    fill_in 'Email:', with: 'skeeter@corgi.com'
    fill_in 'Phone Number:', with: '3033033033'
    fill_in 'Password:', with: 'test'
    fill_in 'Password Confirmation:', with: 'test'
    click_on 'Submit'

  end 
  it 'displays the users username' do
    click_link "Add Location"
    fill_in 'Location:', with: 'Evergreen,CO'
    click_on 'Submit'
    
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Evergreen,CO")
  end


end 