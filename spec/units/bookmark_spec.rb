require 'bookmark'

describe Bookmark do
  let(:bookmarks) { Bookmark.all }
  describe '.all' do # class method so no preceding '#' in description
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.channel4.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.netflix.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.bbc.co.uk/iplayer');")

      expect(bookmarks).to include 'https://www.channel4.com'
      expect(bookmarks).to include 'https://www.netflix.com'
      expect(bookmarks).to include 'https://www.bbc.co.uk/iplayer'
    end
  end

  describe '.create' do
    it 'creates a bookmark' do
      Bookmark.create(url: 'https://www.itv.com/hub/itv')
      expect(bookmarks).to include('https://www.itv.com/hub/itv')
    end
  end
end


