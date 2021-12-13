require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE bookmarks, comments;')
end
# clears the bookmarks table - TRUNCATE faster than DROP TABLE 
