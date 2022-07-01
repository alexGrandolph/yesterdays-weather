require 'rails_helper'

RSpec.describe 'User Dashboard' do
  def sign_up_add_location 
    visit '/register'

    fill_in 'Username:', with: 'Skeeter8'
    fill_in 'Email:', with: 'skeeter@corgi.com'
    fill_in 'Phone Number:', with: '3033235373'
    fill_in 'Password:', with: 'test'
    fill_in 'Password Confirmation:', with: 'test'
    click_on 'Submit'

    visit '/locations/new'
    fill_in 'Location:', with: 'Evergreen,CO'
    click_on 'Submit'
  end 

  def add_location
    user = User.create!(username: 'Skeeter', email: 'corgi@dog.com', phone: '3033235373', password: 'test')
    location = Location.create!(user: user, name: 'Evergreen CO')
    user

  end 
  it 'displays the users username' do
    visit '/register'

    fill_in 'Username:', with: 'Skeeter8'
    fill_in 'Email:', with: 'skeeter@corgi.com'
    fill_in 'Phone Number:', with: '3033235373'
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

  it 'has a link to receive texts for a location' do
    sign_up_add_location 
    visit '/dashboard'
    # save_and_open_page
    click_link "Receive Texts for This Location"
    

  end 

end