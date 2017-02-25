require 'rails_helper'

feature 'Index page' do

  scenario 'User is greeted by welcome page when visiting site' do
    visit '/'
    expect(page).to have_content('Welcome to PicX')
  end
end
