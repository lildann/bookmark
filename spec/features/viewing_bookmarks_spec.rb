feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/bookmarks')
    expect(page).to have_content 'https://www.channel4.com'
    expect(page).to have_content 'https://www.netflix.com'
    expect(page).to have_content 'https://www.bbc.co.uk/iplayer'
  end
end