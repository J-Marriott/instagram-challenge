require 'rails_helper'

feature 'Posts' do

  scenario 'User can post images to the site' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/images/kingfisher.jpg')
    fill_in 'Description', with: 'It\s a Kingfisher! #BirdWatching'
    click_button 'Create Post'
    expect(page).to have_content('#BirdWatching')
    expect(page).to have_css("img[src*='kingfisher.jpg']")
    expect(page).to have_content("Thanks for posting")
  end
  scenario 'User cannot create post without photo' do
    visit '/'
    click_link 'New Post'
    fill_in 'Description', with: 'No image attached'
    click_button 'Create Post'
    expect(page).to have_content("No image selected")
  end
end
