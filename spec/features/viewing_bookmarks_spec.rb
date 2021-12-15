feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(url: 'https://www.channel4.com', title: 'Channel 4')
    Bookmark.create(url: 'https://www.netflix.com', title: 'Netflix')
    Bookmark.create(url: 'https://www.bbc.co.uk/iplayer', title: 'BBC iPlayer')

    visit('/bookmarks')
    expect(page).to have_link('Channel 4', href: 'https://www.channel4.com')
    expect(page).to have_link('Netflix', href: 'https://www.netflix.com')
    expect(page).to have_link('BBC iPlayer', href: 'https://www.bbc.co.uk/iplayer')
  end
end