feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(url: 'https://www.channel4.com')
    Bookmark.create(url: 'https://www.netflix.com')
    Bookmark.create(url: 'https://www.bbc.co.uk/iplayer')

    visit('/bookmarks')
    expect(page).to have_content 'https://www.channel4.com'
    expect(page).to have_content 'https://www.netflix.com'
    expect(page).to have_content 'https://www.bbc.co.uk/iplayer'
  end
end