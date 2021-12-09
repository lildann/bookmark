feature 'Adding Bookmarks' do
  scenario 'a user can add a bookmark to Bookkmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://www.itv.com/hub/itv')
    click_button('Add Bookmark')
    expect(page).to have_content 'https://www.itv.com/hub/itv'
  end
end