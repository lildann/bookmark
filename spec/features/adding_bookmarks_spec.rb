feature 'Adding Bookmarks' do
  scenario 'a user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://www.itv.com/hub/itv')
    fill_in('title', with: 'ITV')
    click_button('Add Bookmark')
    expect(page).to have_link 'ITV', href: 'https://www.itv.com/hub/itv'
  end
end