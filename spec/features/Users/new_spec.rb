require 'rails_helper'

RSpec.describe 'New User Page' do
  it 'clicking link to Sign Up brings user to new user page' do
    visit '/'
    click_on 'Sign Up'
    expect(current_path).to eq('/register')
  end

  it 'filling in sign up form correctly redirects to users dashboard' do
    visit '/register'

    fill_in 'Username:', with: 'Skeeter8'
    fill_in 'Email:', with: 'skeeter@corgi.com'
    fill_in 'Phone Number:', with: '3033033033'
    fill_in 'Password:', with: 'test'
    fill_in 'Password Confirmation:', with: 'test'
    click_on 'Submit'
    expect(current_path).to eq('/dashboard')

  end
end