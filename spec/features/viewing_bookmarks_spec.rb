feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.channel4.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.netflix.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.bbc.co.uk/iplayer');")

    visit('/bookmarks')
    expect(page).to have_content 'https://www.channel4.com'
    expect(page).to have_content 'https://www.netflix.com'
    expect(page).to have_content 'https://www.bbc.co.uk/iplayer'
  end
end