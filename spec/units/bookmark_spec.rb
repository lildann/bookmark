require 'bookmark'

describe Bookmark do
  describe '.all' do # class method so no preceding '#' in description
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all 
      expect(bookmarks).to include 'https://www.channel4.com'
      expect(bookmarks).to include 'https://www.netflix.com'
      expect(bookmarks).to include 'https://www.bbc.co.uk/iplayer'
    end
  end
end