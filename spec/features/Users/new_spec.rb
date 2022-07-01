require 'rails_helper'

RSpec.describe 'New User Page' do
  it 'clicking link to Sign Up brings user to new user page' do
    visit '/'
    click_on 'Sign Up'
    save_and_open_page
    expect(current_path).to eq('/register')
  end
end