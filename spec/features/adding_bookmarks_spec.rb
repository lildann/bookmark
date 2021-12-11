feature 'Adding Bookmarks' do
  scenario 'a user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://www.itv.com/hub/itv')
    fill_in('title', with: 'ITV')
    click_button('Add Bookmark')
    expect(page).to have_link 'ITV', href: 'https://www.itv.com/hub/itv'
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'not a real bookmark')
    click_button('Add Bookmark')
    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end