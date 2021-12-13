feature 'Adding and viewing comments' do
  scenario 'a user can add and then view a comment' do
    bookmark = Bookmark.create(url: "https://www.nowtv.com/gb/watch/home", title: "NOW TV")
    visit '/bookmarks'
    first('.bookmark').click_button 'Comment'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"
    fill_in 'comment', with: "SATC of course"
    click_button "Submit"
    expect(current_path).to eq "/bookmarks"
    expect(first('.bookmark')).to have_content "SATC of course"
  end
end