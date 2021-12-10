feature 'Deleting bookmarks' do
  scenario 'A user can delete a bookmark' do
    Bookmark.create(url: 'https://www.nowtv.com/', title: 'NOW TV')
    visit('/bookmarks')
    expect(page).to have_link('NOW TV', href: 'https://www.nowtv.com/')

    first('.bookmark').click_button('Delete')
    # Capybara #first method will click the Delete button inside the first element with class 'bookmark
    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_link('NOW TV', href: 'https://www.nowtv.com/')
  end
end
