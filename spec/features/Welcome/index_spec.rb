require 'rails_helper'

RSpec.describe 'Welcome/Homepage' do
  it 'Has a header with links for home, signup, if there is no current_user' do
    visit "/"

    expect(page).to have_link("Home")
    expect(page).to have_link("Sign In")

  end
end