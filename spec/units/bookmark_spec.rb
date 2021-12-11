require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do # class method so no preceding '#' in description
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      # Add the test data
      bookmark = Bookmark.create(url: 'https://www.channel4.com', title: 'Channel 4')
      Bookmark.create(url: 'https://www.netflix.com', title: 'Netflix')
      Bookmark.create(url: 'https://www.bbc.co.uk/iplayer', title: 'BBC iPlayer')
      
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_a(Bookmark)
      expect(bookmarks.first.id).to eq(bookmark.id)
      expect(bookmarks.first.title).to eq('Channel 4') 
      expect(bookmarks.first.url).to eq('https://www.channel4.com')
    end
  end

  describe '.create' do
    it 'creates a bookmark' do
      bookmark = Bookmark.create(url: 'https://www.itv.com/hub/itv', title: 'ITV')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a(Bookmark)
      expect(bookmark.id).to eq(persisted_data['id'])
      expect(bookmark.url).to eq('https://www.itv.com/hub/itv')
      expect(bookmark.title).to eq('ITV')
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do 
      bookmark =     Bookmark.create(url: 'https://www.nowtv.com/', title: 'NOW TV')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq(0)
    end
  end

  describe '.update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create(title: 'YouCube', url: 'http://www.youcube.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.youtube.com', title: 'YouTube')
  
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'YouTube'
      expect(updated_bookmark.url).to eq 'http://www.youtube.com'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'YouCube', url: 'http://www.youcube.com')
      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'YouCube'
      expect(result.url).to eq 'http://www.youcube.com'
    end
  end
end


