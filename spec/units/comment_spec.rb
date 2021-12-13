require 'database_helpers'
require 'comment'
require 'bookmark'

describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      bookmark = Bookmark.create(url: "https://www.nowtv.com/gb/watch/home", title: "NOW TV")
      comment = Comment.create(text: 'SATC of course', bookmark_id: bookmark.id)
      
      persisted_data = persisted_data(table: 'comments', id: comment.id )

      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'SATC of course'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end

  describe '.where' do
    it 'gets the relevant comments from the databse' do
      bookmark = Bookmark.create(url: "https://www.nowtv.com/gb/watch/home", title: "NOW TV")
      comment = Comment.create(text: 'SATC of course', bookmark_id: bookmark.id)
      Comment.create(text: 'Curb of course', bookmark_id: bookmark.id)

      comments = Comment.where(bookmark_id: bookmark.id)
      comment = comments.first
      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comments.length).to eq 2
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'SATC of course'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end
end