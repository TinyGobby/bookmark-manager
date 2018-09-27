require 'pg'

# this class holds static bookmarks
class Bookmark
  def self.all
    self.check_test_environment
    list = @connection.exec 'SELECT * FROM bookmarks'
    list.map { |bookmark| bookmark['url'] }
  end

  def self.create(url)
    @connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}');")
  end

  private

  def self.check_test_environment
    if ENV['BOOKMARK_MANAGER'] = 'TEST'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else 
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end