require 'pg'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec('SELECT * FROM bookmarks')
    result.map do |bookmark| 
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end 
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    
      # To protect against SQL injection use .exec_params("SQL query string;", [params in array form]) 
      # The first argument is our SQL query template
      # The second argument is the 'params' referred to in exec_params
      # $1 refers to the first item in the params array
      # $2 refers to the second item in the params array
    result = connection.exec_params("INSERT INTO bookmarks (title, url) VALUES($1, $2) 
      RETURNING id, url, title;", [title, url])
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec_params("DELETE FROM bookmarks WHERE id = $1;", [id])
  end
end



