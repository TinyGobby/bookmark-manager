require 'pg'
require 'uri'

# this class holds static bookmarks
class Bookmark
  def self.all
    check_test_environment
    list = @connection.exec 'SELECT * FROM bookmarks'
    list.map { |bookmark| bookmark['url'] }
  end

  def self.create(url)
    return false unless correct?(url)
    check_test_environment
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
  
  def self.correct?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end