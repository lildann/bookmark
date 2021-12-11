feature 'Updating bookmarks' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.youcube.com', title: 'YouCube')
    visit('/bookmarks')
    expect(page).to have_link('YouCube', href: 'http://www.youcube.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: "https://www.youtube.com")
    fill_in('title', with: "YouTube")
    click_button('Edit')

    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_link('YouCube', href: 'http://www.youcube.com')
    expect(page).to have_link('YouTube', href: 'https://www.youtube.com')
  end
end