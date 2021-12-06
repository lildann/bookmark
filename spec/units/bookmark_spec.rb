require 'bookmark'

describe Bookmark do
  describe '.all' do # class method so no preceding '#' in description
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.channel4.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.netflix.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.bbc.co.uk/iplayer');")

      bookmarks = Bookmark.all 
      expect(bookmarks).to include 'https://www.channel4.com'
      expect(bookmarks).to include 'https://www.netflix.com'
      expect(bookmarks).to include 'https://www.bbc.co.uk/iplayer'
    end
  end
end